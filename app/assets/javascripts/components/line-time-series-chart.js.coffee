App.LineTimeSeriesChartComponent = Ember.Component.extend
  tagName: 'div'
  classNames: ['highcharts']

  contentChanged: (->
    @rerender()
  ).observes('series', 'data')

  didInsertElement:( ->
    this.draw()
  )

  contentDidChange: Ember.observer(->
    @clean()
    @draw()
    return
  , "title"),

  clean:( ->
    $(@get("title")).empty()
    $(@get("data")).empty()
  ),

  draw: ->
    $("##{@chartId}").highcharts({
      chart: { zoomType: 'x' },
      title: { text:  this.get('title') }, #{ text: 'Non Linear Sample Data' }, # Possibly dynamic
      subtitle: {
        text: 'Click and drag the plot area to zoom in'
      },
      xAxis: {
        type: 'datetime',
        minRange: 10 * 24 * 3600000 # 10 TODO days could make smaller?
      },
      yAxis: {
        title: {
          text: 'Data Values Units' # TODO make dynamic based on units
        },
      },
      legend: { enabled: false },
      plotOptions: {
        area: {
          fillColor: {
            linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
            stops: [
              [0, Highcharts.getOptions().colors[0]],
              [1, Highcharts.Color(Highcharts.getOptions().colors[0]).setOpacity(0).get('rgba')]
            ]
          },

          marker: { radius: 2 },
          lineWidth: 1,
          states: {
            hover: { lineWidth: 1 }
          },
          threshold: null
        }
      },
      series: [{
        type: 'area',
        name: 'Data Value', # TODO dynamically get property
        data:  @data ,
#              [
#                [Date.UTC(2012,  9, 27), 0   ],
#                [Date.UTC(2012, 10, 10), 0.6 ],
#                [Date.UTC(2012, 10, 18), 0.7 ],
#                [Date.UTC(2012, 11,  2), 0.8 ],
#                [Date.UTC(2012, 11,  9), 0.6 ],
#                [Date.UTC(2012, 11, 16), 0.6 ],
#                [Date.UTC(2012, 11, 28), 0.67],
#                [Date.UTC(2013,  0,  1), 0.81],
#                [Date.UTC(2013,  0,  8), 0.78],
#                [Date.UTC(2013,  0, 12), 0.98],
#                [Date.UTC(2013,  0, 27), 1.84],
#                [Date.UTC(2013,  1, 10), 1.80],
#                [Date.UTC(2013,  1, 18), 1.80],
#                [Date.UTC(2013,  1, 24), 1.92],
#                [Date.UTC(2013,  2,  4), 2.49],
#                [Date.UTC(2013,  2, 11), 2.79],
#                [Date.UTC(2013,  2, 15), 2.73],
#                [Date.UTC(2013,  2, 25), 2.61],
#                [Date.UTC(2013,  3,  2), 2.76],
#                [Date.UTC(2013,  3,  6), 2.82],
#                [Date.UTC(2013,  3, 13), 2.8 ],
#                [Date.UTC(2013,  4,  3), 2.1 ],
#                [Date.UTC(2013,  4, 26), 1.1 ],
#                [Date.UTC(2013,  5,  9), 0.25],
#                [Date.UTC(2013,  5, 12), 2.99],
#                [Date.UTC(2013,  5, 12), 3   ],
#              ]
      }]
    })
