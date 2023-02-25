// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

String importBaseStyle() {
  String styles = '''<style>
  /* all */
  *, ::-moz-focus-inner {
    border-style: none;
    background-color: transparent;
    padding: 0;
    margin: 0;
    outline: none;
  }
  
  *, ::before, ::after {
    background-repeat: no-repeat;
    box-sizing: inherit;
  }
  
  ::before, ::after {
    text-decoration: inherit;
    vertical-align: inherit;
  }
  
  ::placeholder {
    color: var(--rc-text-placeholder);
  }
  
  ::-webkit-scrollbar {
    height: 10px;
    width: 10px;
  }

  ::-webkit-scrollbar-track {
    background-color: var(--rc-background);
    border-radius: 6px;
  }

  ::-webkit-scrollbar-thumb {
    background-color: var(--rc-scrollbar-thumb);
    border-radius: 6px;
  }

  ::-webkit-scrollbar-thumb:hover {
    background-color: var(--rc-scrollbar-thumb-hover);
  }
  
  ::-webkit-file-upload-button {
    -webkit-appearance: button;
    color: inherit;
    font: inherit;
  }
  
  [disabled] {
    cursor: default;
  }
  
  [aria-busy='true'] {
    cursor: progress;
  }

  [aria-controls] {
    cursor: pointer;
  }

  [aria-disabled='true'] {
    cursor: default;
  }
  
  /* html */
  html {
    box-sizing: border-box;
    -webkit-text-size-adjust: 100%;
    word-break: normal;
    -moz-tab-size: 4;
    tab-size: 4;
    scrollbar-color: var(--rc-scrollbar-thumb) var(--rc-background-body);
    scrollbar-width: thin;
  }
  
  /* body */
  body {
    font-family: system-ui, -apple-system, BlinkMacSystemFont,
     'Segoe UI', 'Roboto', 'Oxygen', 'Ubuntu', 'Cantarell',
     'Fira Sans', 'Droid Sans', 'Helvetica Neue', 
     'Segoe UI Emoji', 'Apple Color Emoji', 
     'Noto Color Emoji', sans-serif;
    line-height: 1.4;
    margin: var(--rv-margin-body);
    max-width: var(--rv-max-width-body);
    padding: var(--rv-padding-body);
    word-wrap: break-word;
    color: var(--rc-text);
    background-color: var(--rc-background-body);
    text-rendering: optimizeLegibility;
    -webkit-font-smoothing: antialiased;
    outline: none;
    width: 100%;
    height: 100%;
    font-size: 16px;
  }
  
  /* p */
  p {
    margin: 15px 0;
  }
  
  /* h1-h6, string, b, th */
  h1 {
    font-size: 40px;
    font-weight: 700;
    line-height: 48px;
  }
  
  h2 {
    font-size: 24px;
    font-weight: 700;
    line-height: 32px;
  }
  
  h3 {
    font-size: 20px;
    font-weight: 700;
    line-height: 24px;
  }
  
  h1, h2, h3, h4, h5, h6 {
    margin-bottom: 12px;
    margin-top: 24px;
    user-select: text;
    text-align: left;
  }
  
  h1, h2, h3, h4, h5, h6, strong, b, th {
    color: var(--rc-text);
  }
  
  h1, h2, h3, h4, h5, h6, b, strong, th {
    font-weight: 700;
  }
  
  /* hr */
  hr {
    height: 0;
    color: inherit;
    border: none;
    border-top: 1px solid var(--rc-border);
  }
  
  /* small */
  small {
    font-size: 80%;
  }
  
  /* abbr */
  abbr[title] {
    border-bottom: none;
    text-decoration: underline dotted;
    text-decoration-thickness: 2px;
  }
  
  /* code, samp, tile, kbd, var */
  code, samp, time, kbd, var {
    background-color: var(--rc-background);
    padding: 0 4px;
    border-radius: 4px;
    font-family: monospace, monospace;
    font-style: normal;
  }
  
  kbd {
    border: 2px solid var(--rc-border);
  }
  
  mark {
    background-color: var(--rc-background-mark);
    padding: 0 4px;
  }
  
  /* q, blockquote */
  q::before {
    content: none;
  }

  q::after {
    content: none;
  }
  
  blockquote, q {
    border-radius: 4px;
    border-left: 4px solid var(--rc-border);
    color: var(--rc-text-placeholder);
    margin: 15px 0;
    padding-block-start: 0.5em;
    padding-block-end: 0.5em;
    padding-inline-start: 20px;
    padding-inline-end: 20px;
  }
  
  /* a */
  a {
    border-radius: 4px;
    padding: 0 2px;
    cursor: pointer;
    text-decoration: none;
    color: var(--rc-text-link);
    outline-width: 0;
  }
  
  a:active, a:hover, a:focus {
    outline-width: 0;
  }
  
  a:hover {
    color: var(--rc-text-link-hover);
    text-decoration: underline;
  }
  
  /* pre */
  pre > code {
    background-color: var(--rc-background);
    margin: 15px 0;
    padding: 9px 18px;
    display: block;
    overflow-x: hidden;
    white-space: pre-wrap;
    overflow-wrap: break-word;
  }
  
  /* sub, sup */
  sub, sup {
    font-size: 75%;
    line-height: 0;
    position: relative;
    vertical-align: baseline;
  }
  
  sup {
    top: -0.5em;
  }
  
  sub {
    bottom: -0.25em;
  }
  
  /* iframe */
  iframe {
    border-style: none;
  }
  
  /* button, input, select */
  a, button, input, textarea, select {
    transition:
      background-color var(--rd-animation) linear,
      border-color var(--rd-animation) linear,
      color var(--rd-animation) linear,
      box-shadow var(--rd-animation) linear,
      transform var(--rd-animation) ease;
  }
  
  input[type=search],
  input[type=search]::-webkit-search-decoration,
  input[type=search]::-webkit-search-cancel-button,
  input[type=search]::-webkit-search-results-button,
  input[type=search]::-webkit-search-results-decoration { 
    -webkit-appearance: textfield;
    display: none; 
    outline-offset: -2px;
  }
  
  input[type=number],
  input[type=number]::-webkit-outer-spin-button,
  input[type=number]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    -moz-appearance: textfield !important;
  }
  
  button, [type='button'], [type='reset'], [type='submit'] {
    -webkit-appearance: button;
  }
  
  button, select, input[type] {
    user-select: none;
    -webkit-user-select: none;
    cursor: pointer;
  }
  
  input[type=search], input[type=email], input[type=text], 
  input[type=number], input[type=password], input[type=tel], 
  input[type=url] {
    cursor: text;
  }
  
  input, button, textarea, select {
    color: var(--rc-text-form);
    background-color: var(--rc-background);
    font-family: inherit;
    font-size: inherit;
    margin-right: var(--rv-space);
    margin-bottom: var(--rv-space);
    padding: var(--rv-top-bottom-padding) var(--rv-left-right-padding);
    border: none;
    border-radius: var(--rv-border-radius);
    outline: none;
  }
  
  input:last-child, button:last-child, textarea:last-child, select:last-child {
    margin-right: 0;
  }
  
  button, input[type='button'], input[type='submit'], input[type='reset'] {
    color: var(--rc-button-text);
  }
  
  select {
    border-right: var(--rv-left-right-padding) solid transparent;
    transition: var(--rd-animation) linear;
    background-color: var(--rc-background);
  }
  
  select option {
    padding: 6px 12px;
    border-radius: var(--rv-more-border-radius);
    transition: var(--rd-animation) linear;
  }
  
  select option:hover {
    color: var(--rc-button);
  }
  
  select option:checked {
    background-color: var(--rc-selected);
    color: var(--rc-selected-text);
    font-weight: 600;
  }
  
  select[multiple] {
    border-right: 0;
    background-image: none;
    overflow-y: auto;
  }
  
  input:focus, select:focus, button:focus, textarea:focus, a:focus {
    box-shadow: 0 0 0 1px var(--rc-focus);
  }
  
  button, input[type='submit'], input[type='reset'], input[type='button'] {
    background-color: var(--rc-button);
    padding-right: 30px;
    padding-left: 30px;
  }
  
  button:hover, input[type='submit']:hover, input[type='reset']:hover,
  input[type='button']:hover {
    background-color: var(--rc-button-hover);
  }
  
  input:active, button:active, textarea:active, select:active {
    transform: translateY(2px);
  }
  
  input:disabled, select:disabled, button:disabled, textarea:disabled {
    cursor: not-allowed;
    opacity: 0.5;
  }
  
  /* textarea */
  textarea {
    display: block;
    margin-right: 0;
    box-sizing: border-box;
    resize: vertical;
  }
  
  textarea:not([cols]) {
    width: 100%;
  }
  
  textarea:not([rows]) {
    min-height: 40px;
    height: 140px;
  }
  
  /* progress */
  progress {
    vertical-align: baseline;
  }
  
  /* details, summary */
  details {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    background-color: var(--rc-background);
    padding: 9px 18px 0 18px;
    margin: 15px 0;
    border-radius: 4px;
    overflow: hidden;
    transition: var(--rd-animation) linear;
  }

  details > :last-child {
    margin-bottom: 0;
  }
  
  details[open] {
    padding: 9px 18px;
  }

  details[open] summary {
    padding: 9px 18px 0 18px;
  }
  
  details:has(summary:focus) {
    box-shadow: 0 0 0 1px var(--rc-focus) inset;  
  }

  summary {
    color: var(--rc-button);
    font-weight: 700;
    padding: 9px 18px;
    margin: -9px -18px 0;
    cursor: pointer;
    outline: none;
    -webkit-user-select: none;
    transition: var(--rd-animation) linear;
    user-select: none;
  } 
  
  summary:hover {
    color: var(--rc-button-hover);
  }

  details > :not(summary) {
    margin-top: 0;
  }
  
  summary {
    list-style: none
  }
  summary::-webkit-details-marker {
    display: none; 
  }
  
  details summary::after { 
    content: ""; 
    position: relative;
    top: -9px;
    float: right;
    padding: 0 6px;
    transition: var(--rd-animation) linear;
  }
  
  details[open] summary::after { 
    content: ""; 
    position: relative;
    float: right;
    top: -9px;
    padding: 12px 6px;
    border-bottom-left-radius: 4px;
    border-bottom-right-radius: 4px;
    background-color: var(--rc-selected-text);
    transition: var(--rd-animation) linear;
  }
  
  /* img, video */
  img, video {
    max-width: 100%;
    height: auto;
  }
  
  /* fieldset, legend */
  fieldset {
    border: 1px var(--rc-border) solid;
    border-radius: 6px;
    margin: 0 0 12px 0;
    padding: 26px 16px 16px 16px;
  }
  
  legend {
    font-size: 12px;
    line-height: 18px;
    position: relative;
    bottom: -18px;
    padding-top: 18px;
    color: var(--rc-text-muted);
    border-top: 1px solid var(--rc-border);
  }

  /* table, caption, th, td */
  table {
    border-color: inherit;
    text-indent: 0;
    border-collapse: separate;
    margin: 15px 0;
    width: 100%;
    table-layout: fixed;
  }

  table caption {
    text-align: left;
  }
  
  th {
    background-color: var(--rc-background);
  }

  td,
  th {
    border-radius: 4px;
    border: 1px solid var(--rc-border);
    text-align: left;
    vertical-align: top;
    word-wrap: break-word;
    line-height: 24px;
    padding: 8px 16px;
  }

  /* dialog */
  dialog {
    background-color: var(--rc-background-body);
    color: var(--rc-text);
    border: none;
    margin: auto;
    border-radius: 6px;
    border-color: var(--rc-border);
    padding: 16px 24px;
    width: 300px;
  }

  dialog > header:first-child {
    background-color: var(--rc-background);
    border-radius: 6px 6px 0 0;
    margin: -16px -24px;
    border-bottom: 16px solid var(--rc-background-body);
    padding: 10px;
    text-align: center;
  }

  dialog::backdrop {
    background-color: #0000009c;
    backdrop-filter: blur(4px);
  }
  
  /* checkbox */
  input[type="checkbox"] {
    margin: 0;
    -webkit-appearance: none;
    appearance: none;
    background-color: transparent;
    border: 1px solid var(--rc-border-alt);
    font: inherit;
    color: currentColor;
    padding: 0;
    width: 18px;
    height: 18px;
    border-radius: 4px;
    display: grid;
    place-content: center
  }
  
  input[type="checkbox"]:checked {
    background-color: var(--rc-button);
    border-color: var(--rc-button);
  }

  input[type="checkbox"]::before {
    content: "";
    width: 16.2px;
    height: 16.2px;
    clip-path: polygon(13.378px 3.534px, 13.466px 4.378px, 6.966px 12.378px, 6.048px 12.395px, 2.548px 8.395px, 3.452px 7.605px, 6.483px 11.069px, 12.534px 3.622px, 13.378px 3.534px);
    transform: scale(0);
    transform-origin: bottom left;
    transition: var(--rd-animation) linear;
    background-color: var(--rc-button-text);
  }
  
  input[type="checkbox"]:checked::before {
    transform: scale(1);
  }
  
  input[type="checkbox"]:checked:hover {
    background: var(--rc-button-hover);
  }
  
  /* radio */
  input[type="radio"] {
    margin: 0;
    -webkit-appearance: none;
    appearance: none;
    background-color: transparent;
    font: inherit;
    color: currentColor;
    width: 18px;
    height: 18px;
    padding: 0;
    border-radius: 50%;
    border: 1px solid var(--rc-border-alt);
    display: grid;
    place-content: center;
  }
  
  input[type="radio"]:checked {
    background-color: var(--rc-button);
    border-color: var(--rc-button);
  }

  input[type="radio"]::before {
    content: "";
    width: 3px;
    height: 3px;
    border-radius: 50%;
    transform: scale(0);
    transition: var(--rd-animation) linear;
    background-color: var(--rc-button-text);
  }

  input[type="radio"]:checked::before {
    transform: scale(1);
  }
  
  input[type="radio"]:checked:hover {
    background: var(--rc-button-hover);
  }
  
  /* color */
  input[type="color"] {
    border: 1px solid var(--rc-border-alt);
    -webkit-appearance: none;
    padding: 0;
  }
  
  input[type=color]::-webkit-color-swatch-wrapper {
    padding: 0;    
  }
  
  input[type=color]::-webkit-color-swatch {
    border: none;  
    border-radius: var(--rv-more-border-radius);
  }
  
  input[type=color]::-moz-focus-inner {
    border: none;
    padding: 0;
    border-radius: var(--rv-more-border-radius);
  }
  
  input[type=color]::-moz-color-swatch {
    border: none;
    border-radius: var(--rv-more-border-radius);
  }

  /* file */
  input[type=file]::file-selector-button {
    display: none;
  }

  /* footer */
  footer {
    padding-top: 24px;
    margin-top: var(--rv-space);
    border-top: 1px solid var(--rc-border);
    color: var(--rc-text-placeholder);
  }
  </style>''';

  return styles.replaceFirst('<style>', '').replaceFirst('</style>', '');
}
