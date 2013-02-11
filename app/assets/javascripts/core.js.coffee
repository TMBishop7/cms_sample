# Displays filename underneath 'choose file' button
$(document).ready ->
  jQuery("input.file-prev").change ->
    $(this).parent().siblings(".show-prev").html jQuery(this).val()

# Drag/Sort
jQuery ->
  $('#feedsNews').sortable
  	axis: 'y',
    handle: '.handle',
  	update: ->
  		$.post($(this).data('update-url'), $(this).sortable('serialize'))

jQuery ->
  $('#feedsPhotos').sortable
  	axis: 'y',
    handle: '.handle',
  	update: ->
  		$.post($(this).data('update-url'), $(this).sortable('serialize'))

jQuery ->
  $('#feedsVideos').sortable
  	axis: 'y',
    handle: '.handle',
  	update: ->
  		$.post($(this).data('update-url'), $(this).sortable('serialize'))

jQuery ->
  $('#feedsEvents').sortable
  	axis: 'y',
    handle: '.handle',
  	update: ->
  		$.post($(this).data('update-url'), $(this).sortable('serialize'))


# this closes the dropdown
$('a[data-toggle=modal]').on 'click', ->
  $('.dropdown').removeClass('open')

# sets up the ajax loader, will stay until the method specific js removes it
$('a[data-target=#ajax-modal]').on 'click', ->
  $('.ajax-loader').show()

#removes whatever is in the modal body content div upon clicking close/outside modal
$('#modal-close-btn').on 'click', '#ajax-modal', (e) ->
  e.stopPropagation();