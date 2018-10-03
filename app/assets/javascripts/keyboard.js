// http://www.openjs.com/scripts/events/keyboard_shortcuts/

$( document ).ready(function() {
  // Task
  shortcut.add("t",function() {
    // alert("Creating a new task...");
    // window.open(r); // Popup
    window.location = "/tasks/new";
  },{
    'type':'keypress',
    'propagate':true,
    'disable_in_input':true,
    'target':document
  });

  // Event
  shortcut.add("e",function() {
    // alert("Creating a new event...");
    // window.open(r); // Popup
    window.location = "/events/new";
  },{
    'type':'keypress',
    'propagate':true,
    'disable_in_input':true,
    'target':document
  });

  // Note
  shortcut.add("n",function() {
    // alert("Creating a new note...");
    // window.open(r); // Popup
    window.location = "/notes/new";
  },{
    'type':'keypress',
    'propagate':true,
    'disable_in_input':true,
    'target':document
  });

  // Navigation
  shortcut.add("Shift+H",function() {
    // console.log("Navigating to root...");
    // window.open(r); // Popup
    window.location = "/";
  },{
    'type':'keypress',
    'propagate':true,
    'disable_in_input':true,
    'target':document
  });
});
