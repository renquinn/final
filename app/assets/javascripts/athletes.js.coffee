# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-scripe
$ ->
	$('#post_league').live 'change', (event) ->
		l = $(this).val()
		$('.ajax-loader').show()
		$.get '/athletes?post%5Bleague%5D='+l,
			(data) ->
				$('.table').html('')
				$.each $(data).find('.table')[0].rows, (key, value) ->
					$('.table').append(value)
				$('.ajax-loader').hide()

