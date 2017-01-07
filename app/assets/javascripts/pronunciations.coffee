window.Pronunciations = do ->
  abuseReportButtonSelector = '[data-abuse-report-button]'

  initialize = ->
    bindEvents()

  bindEvents = ->
    bindAbuseReportButtonClickEvent()

  bindAbuseReportButtonClickEvent = ->
    $(abuseReportButtonSelector).on 'click', (event) ->
      $button = $(event.currentTarget)
      index = $button.data('abuse-report-button')
      debugger
      $("[data-abuse-report-container='#{index}']").show()

  initialize: initialize

$ ->
  if $('[data-container="pronunciations"]').size() > 0
    window.Pronunciations.initialize()
