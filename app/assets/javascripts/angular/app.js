var app = angular.module("app", ['ui.router', 'oxymoron','ngMaterial']);
app.config(function ($stateProvider,$mdThemingProvider) {
    $stateProvider.rails();
    $mdThemingProvider.theme('default')
        .primaryPalette('teal')
        .accentPalette('deep-orange');
});