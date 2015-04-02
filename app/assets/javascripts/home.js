var helperApp = angular.module("helperApp", ["ui.router"])

helperApp.config([ "$stateProvider", "$urlRouterProvider", function($stateProvider, $urlRouterProvider){

	$stateProvider
		.state("home", { url:"", views:{ "home":{ templateUrl:"partials/home.html"}}})

	$urlRouterProvider.otherwise("") 

}])