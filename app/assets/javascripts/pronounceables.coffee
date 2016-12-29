window.Pronounceables = do ->
  dataLinkToSelector = '[data-link-to]'

  initialize = ->
    bindEvents()

  bindEvents = ->
    bindPronounceableCardClickEvent()

  bindPronounceableCardClickEvent = (e) ->
    $(dataLinkToSelector).on 'click', (event) ->
      $pronounceable = $(event.currentTarget)
      pronounceableUrl = $pronounceable.data('link-to')
      window.location.replace(pronounceableUrl)

  initialize: initialize

$ ->
  if $('[data-container="pronounceables"]').size() > 0
    window.Pronounceables.initialize()
