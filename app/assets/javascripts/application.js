// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require moment 
//= require fullcalendar
//= require fullcalendar/gcal

$(function() {
  $('#calendar').fullCalendar({
    header: {
      left: 'prev,next today',
      center: 'title',
      right: 'month,agendaWeek,agendaDay'
    },
    defaultDate: '2014-09-12',
    editable: true,
    eventLimit: true, // allow "more" link when too many events
    events: [
      {
        title: 'All Day Event',
        start: '2014-09-01'
      },
      {
        id: 999,
        title: 'Repeating Event',
        start: '2014-09-09T16:00:00'
      },
      {
        id: 999,
        title: 'Repeating Event',
        start: '2014-09-16T16:00:00'
      },
      {
        title: 'Conference',
        start: '2014-09-11',
        end: '2014-09-13'
      },
      {
        title: 'Meeting',
        start: '2014-09-12T10:30:00',
        end: '2014-09-12T12:30:00'
      },
      {
        title: 'Lunch',
        start: '2014-09-12T12:00:00'
      },
      {
        title: 'Meeting',
        start: '2014-09-12T14:30:00'
      },
      {
        title: 'Happy Hour',
        start: '2014-09-12T17:30:00'
      },
      {
        title: 'Dinner',
        start: '2014-09-12T20:00:00'
      },
      {
        title: 'Click for Google',
        url: 'http://google.com/',
        start: '2014-09-28'
      }
    ]
  });
});


$('#add').click(function addCalanderEvent(id, start, end, title, colour)
{
    var eventObject = {
    title: title,
    start: start,
    end: end,
    id: id,
    color: colour
    };

    $('#calendar').fullCalendar('renderEvent', eventObject, true);
    return eventObject; }









    