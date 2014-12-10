App.LiveTimeSeriesChartComponent = Ember.Component.extend
  tagName: 'div'
  classNames: ['highcharts']

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
    dataTransToken = @get('sensorData.transmitter_token')
    transToken = @get('pin.transmitter.transmitter_token')
    if dataTransToken != transToken
      return

    chart = $("##{@chartId}").highcharts()
    series = chart.series[0]
    pin = @get('pin.name')
    sensorData = @get('sensorData')
    time = (new Date).getTime()
    value = sensorData[pin]
    scope = { x : value }
    calculated_value = null
    # apply the sensor formula
    try
      calculated_value = math.eval(@formula, scope)
    catch
      calculated_value = value
      
    series.addPoint([time, calculated_value],true, true)
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
        text: @get('pin.transmitter.name')
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

