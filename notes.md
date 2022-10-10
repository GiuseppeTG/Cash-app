### Format erb documents and use emmet
> gem 'htmlbeautifier'
> extension ERB Formatter/Beautify
> extension ruby-rubocop

##### Settings.json

```
"emmet.includeLanguages": {
        "javascript": "javascriptreact",
        "erb": "html",
        "ruby": "html"
    },
```

```
"files.associations": {
        "*.html.erb": "erb"
    },
    "vscode-erb-beautify.keepBlankLines": 1
```

To open settings.json: 
>- Open VSCode setting
>- In the search input type `emmet`
>- Under `Emmet: Prefereces`, click on `Edit in settings.json`