window.Initializers = do ->
  initialize = ($scope) ->
    initializeTableSorting($scope)
    initializeRowClick($scope)

  initializeTableSorting = ($scope) ->
    $scope.find('table').tablesort()

  initializeRowClick = ($scope) ->
    $scope.find('[data-row-click]').on 'click', (event) ->
      $row = $(event.currentTarget)
      window.location.replace($row.data('row-click'))

  initialize: initialize
