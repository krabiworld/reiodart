String importBaseStyles({bool? tags}) {
  String styles = '''<style>
  html {
    box-sizing: border-box;
    /* Prevent adjustments of font size */
    /* after orientation changes in iOS. */
    -webkit-text-size-adjust: 100%;
    word-break: normal;
    -moz-tab-size: 4;
    tab-size: 4;
  }
  
  *, ::before, ::after {
    background-repeat: no-repeat;
    box-sizing: inherit;
  }
  
  ::before, ::after {
    /* Inherit text-decoration and vertical align */
    /* to ::before and ::after pseudo elements. */
    text-decoration: inherit;
    vertical-align: inherit;
  }
  
  * {
    padding: 0;
    margin: 0;
  }
  
  hr {
    /* Corrections for FireFox. */
    height: 0;
    color: inherit;
  }
  
  summary {
    /* Add the correct display in all browsers. */
    display: list-item;
  }
  
  small {
    /* Set font-size to 80% in `small` elements. */
    font-size: 80%;
  }
  
  abbr[title] {
    /* Remove the bottom border in Chrome 57. */
    border-bottom: none;
    /* Add the correct text decoration in */
    /* Chrome, Edge, IE, Opera, and Safari. */
    text-decoration: underline dotted;
  }
  
  a:active, a:hover {
    /* Remove the outline when hovering in all browsers. */
    outline-width: 0;
  }
  
  code, kbd, pre, samp {
    /* Specify the font family of code elements. */
    font-family: monospace, monospace;
  }
  
  pre {
    /* Correct the odd `em` font sizing in all browsers. */
    font-size: 1em;
  }
  
  b, strong {
    /* Add the correct font weight in Chrome, Edge, and Safari. */
    font-weight: bolder;
  }
  
  sub, sup {
    /* Specified in % so that the sup/sup is the */
    /* right size relative to the surrounding text. */
    font-size: 75%;
  
    /* Zero out the line-height so that it doesn't */
    /* interfere with the positioning that follows. */
    line-height: 0;
  
    /* Where the magic happens: makes all browsers position */
    /* the sup/sup properly, relative to the surrounding text. */
    position: relative;
  
    /* Note that if you're using Eric Meyer's reset.css, this */
    /* is already set and you can remove this rule. */
    vertical-align: baseline;
  }
  
  sup {
    /* Move the superscripted text up. */
    top: -0.5em;
  }
  
  sub {
    /* Move the subscripted text down, but only */
    /* half as far down as the superscript moved up. */
    bottom: -0.25em;
  }
  
  table {
    /* Correct border color in all Chrome, Edge, and Safari. */
    /* Remove text indentation in Chrome, Edge, and Safari. */
    border-color: inherit;
    text-indent: 0;
  }
  
  iframe {
    border-style: none;
  }
  
  input {
    border-radius: 0;
  }
  
  [type='number']::-webkit-inner-spin-button,
  [type='number']::-webkit-outer-spin-button {
    /* Correct the cursor style of increment */
    /* and decrement buttons in Chrome. */
    height: auto;
  }
  
  [type='search'] {
    /* Corrections for Safari. */
    -webkit-appearance: textfield;
    outline-offset: -2px;
  }
  
  [type='search']::-webkit-search-decoration {
    /* Remove the inner padding in Chrome and Safari on macOS. */
    -webkit-appearance: none;
  }
  
  textarea {
    resize: vertical;
  }
  
  button, input, optgroup, select, textarea {
    /* Specify font inheritance of form elements. */
    font: inherit;
  }
  
  optgroup {
    /* Restore the font weight unset by the previous rule. */
    font-weight: bold;
  }
  
  button, select {
    /* Firefox 40+, Internet Explorer 11-. */
    text-transform: none;
  }
  
  button, [type='button'], [type='reset'], 
  [type='submit'], [role='button'] {
    /* Apply cursor pointer to button elements. */
    cursor: pointer;
  }
  
  button::-moz-focus-inner, [type='button']::-moz-focus-inner,
  [type='reset']::-moz-focus-inner, [type='submit']::-moz-focus-inner {
    /* Remove inner padding and border in Firefox 4+. */
    border-style: none;
    padding: 0;
  }
  
  button:-moz-focusring, [type='button']::-moz-focus-inner,
  [type='reset']::-moz-focus-inner, [type='submit']::-moz-focus-inner {
    /* Replace focus style removed in the border reset above. */
    outline: 1px dotted ButtonText;
  }
  
  button, html [type='button'], [type='reset'], [type='submit'] {
    /* Correct the inability to style clickable types in iOS. */
    -webkit-appearance: button;
  }
  
  button, input, select, textarea {
    /* Remove the default button styling in all browsers. */
    background-color: transparent;
    border-style: none;
  }
  
  select {
    -moz-appearance: none; /* Firefox 36+ */
    -webkit-appearance: none; /* Chrome 41+ */
  }
  
  ::-webkit-file-upload-button {
    /* Correct the inability to style */
    /* clickable types in iOS and Safari */
    -webkit-appearance: button;
    color: inherit;
    font: inherit;
  }
  
  [disabled] {
    /* Replace pointer cursor in disabled elements */
    cursor: default;
  }

  progress {
    /* Add the correct vertical alignment */
    /* in Chrome, Firefox, and Opera */
    vertical-align: baseline;
  }

  [aria-busy='true'] {
    /* Specify the progress cursor of updating elements */
    cursor: progress;
  }

  [aria-controls] {
    /* Specify the pointer cursor of trigger elements */
    cursor: pointer;
  }

  [aria-disabled='true'] {
    /* Specify the unstyled cursor of disabled, */
    /* not-editable, or otherwise inoperable elements */
    cursor: default;
  }
  </style>''';

  if (tags == false) {
    return styles.replaceFirst('<style>', '').replaceFirst('</style>', '');
  }

  return styles;
}
