// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

enum Theme { light, dark }

String importRootStyle({Theme? theme = Theme.light}) {
  String styles = '''<style>
  :root {
    --rv-margin-body: 40px auto;
    --rv-max-width-body: 800px;
    --rv-padding-body: 0 10px;
    
    --rv-space: 7px;
    
    --rv-border-radius: 4px;
    --rv-more-border-radius: 6px;
    
    --rv-top-bottom-padding: 9px;
    --rv-left-right-padding: 18px;
    
    --rd-animation: 0.1s;
  }
  </style>'''
      .replaceFirst('<style>', '')
      .replaceFirst('</style>', '');

  if (theme == Theme.light) {
    styles += '''<style>
    :root {
      --rc-background-body: rgb(255, 255, 255);
      --rc-background: rgb(245, 247, 249);
      --rc-background-mark: rgb(255, 236, 130);
      
      --rc-border: rgb(227, 232, 237);
      --rc-border-alt: rgb(211, 220, 228);
      
      --rc-text: rgb(59, 69, 78);
      --rc-text-link: rgb(52, 109, 219);
      --rc-text-link-hover: rgb(0, 0, 238);
      --rc-text-form: rgb(39, 49, 58);
      --rc-text-placeholder: rgb(92, 105, 117);
      --rc-text-muted: rgb(136, 153, 168);
      
      --rc-selected: rgba(133, 163, 224, 0.1);
      --rc-selected-text: rgb(52, 109, 219);
      
      --rc-button: rgb(52, 109, 219);
      --rc-button-hover: rgb(42, 99, 209);
      --rc-button-text: rgb(255, 255, 255);
      
      --rc-focus: rgb(52, 109, 219);
      
      --rc-scrollbar-thumb: rgb(207, 207, 207);
      --rc-scrollbar-thumb-hover: rgb(155, 155, 155);
    }
    
    html {
      color-scheme: light;
    }
    </style>'''
        .replaceFirst('<style>', '')
        .replaceFirst('</style>', '');
  }

  if (theme == Theme.dark) {
    styles += '''<style>
    :root {
      --rc-background-body: rgb(24, 28, 31);
      --rc-background: rgb(34, 39, 46);
      --rc-background-mark: rgb(255, 236, 130);
      
      --rc-border: rgba(55, 65, 81, 0.3);
      --rc-border-alt: rgb(55, 65, 81);
      
      --rc-text: rgb(234, 242, 247);
      --rc-text-link: rgb(145, 176, 240);
      --rc-text-link-hover: rgb(38, 98, 215);
      --rc-text-form: rgb(255, 255, 255);
      --rc-text-placeholder: rgb(204, 207, 212);
      --rc-text-muted: rgb(162, 169, 185);
      
      --rc-selected: rgba(133, 163, 224, 0.1);
      --rc-selected-text: rgb(145, 176, 240);
      
      --rc-button: rgb(145, 176, 240);
      --rc-button-hover: rgb(135, 166, 230);
      --rc-button-text: rgb(0, 0, 0);
      
      --rc-focus: rgb(145, 176, 240);
      
      --rc-scrollbar-thumb: rgb(64, 69, 76);
      --rc-scrollbar-thumb-hover: rgb(44, 49, 56);
   }
   
   html {
      color-scheme: dark;
   }
  </style>'''
        .replaceFirst('<style>', '')
        .replaceFirst('</style>', '');
  }

  return styles;
}
