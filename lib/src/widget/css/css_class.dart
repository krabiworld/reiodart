// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

String importClassStyle() {
  String styles = '''<style>
  .rsl {
    margin-left: var(--rv-space);
  }
  
  .rsr {
    margin-right: var(--rv-space);
  }
  
  div.rli {
    clear: both;
    margin-bottom: var(--rv-space);
  }
  
  div.rli label {
    display: inline-block;
    vertical-align: middle;
    line-height: normal;
    cursor: pointer;
    user-select: none;
    -webkit-user-select: none;
    transition: var(--rd-animation) linear;
  }
  
  div.rli:has(input:disabled) label {
    cursor: not-allowed;
  }
  
  div.rli:has(input:not(:disabled)) label:hover {
    color: var(--rc-button-hover);
  }
  
  div.rli input {
    margin-right: var(--rv-top-bottom-padding);
    float: left;
  }
  
  div.rli input[type=radio], div.rli input[type=checkbox] {
    position: relative;
    bottom: -4px;
  }
  
  div.rli input[type=button] {
    float:none;
  }
  </style>''';

  return styles.replaceFirst('<style>', '').replaceFirst('</style>', '');
}
