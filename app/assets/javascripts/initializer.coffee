window.Initializers = do ->
  initialize = ($scope) ->
    initializeTableSorting($scope)
    initializeDropdown($scope)
    initializeRowClick($scope)

  initializeTableSorting = ($scope) ->
    $scope.find('table').tablesort()

  initializeDropdown = ($scope) ->
    $scope.find('.ui.dropdown').dropdown()

  initializeRowClick = ($scope) ->
    $scope.find('[data-row-click]').on 'click', (event) ->
      $row = $(event.currentTarget)
      window.location.replace($row.data('row-click'))

  initialize: initialize
