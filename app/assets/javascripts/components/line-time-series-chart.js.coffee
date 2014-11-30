App.LineTimeSeriesChartComponent = Ember.Component.extend
  tagName: 'div'
  classNames: ['highcharts']

  contentChanged: (->
    #@rerender()
  ).observes('data', 'formula')

  didInsertElement:( ->
    Highcharts.setOptions({
      global: {
        useUTC: false
      }
    })
    @draw()
  )
  
  updateTitle: (->
    chart = $("##{@chartId}").highcharts()
    chart.setTitle({
      text: @get('title')
    }
    )).observes('title')

  loadData: (->
    chart = $("##{@chartId}").highcharts()
    series = chart.series[0]
    sensorData = @get('sensorData')
    pin = @get('pin.name')
    time = (new Date).getTime()
    series.addPoint([time, sensorData[pin]],true, true)
  ).observes('sensorData')

  draw: ->
    $("##{@chartId}").highcharts({
      chart: { 
        type: 'spline',
        animation: Highcharts.svg,
        marginRight:10,
      },
      title: { text:  @get('title') }, #{ text: 'Non Linear Sample Data' }, # Possibly dynamic
      subtitle: {
        text: 'Click and drag the plot area to zoom in'
      },
      xAxis: {
        type: 'datetime',
        tickPixelInterval: 150
        #minRange: 10 * 24 * 3600000 # 10 TODO days could make smaller?
        #
      },
      yAxis: {
        title: {
          text: 'Data Values Units' # TODO make dynamic based on units
        },
      },
      legend: { enabled: false },
      series: [{
        name: 'Data Value', # TODO dynamically get property
        data: (->
          data = [] 
          time = (new Date()).getTime()
          for i in [-19..0]
            data.push({
              x: ( time + i * 1000), 
              y: 42  
            })   
          return data
        )()
      }]
    })

