# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to make opened Markdown files always be soft wrapped:
#
# path = require 'path'
#
# atom.workspaceView.eachEditorView (editorView) ->
#   editor = editorView.getEditor()
#   if path.extname(editor.getPath()) is '.md'
#     editor.setSoftWrapped(true)

atom.commands.add 'atom-text-editor', 'custom:copy-line', ->
  editor = atom.workspace.getActiveTextEditor()
  editor.selectLinesContainingCursors() unless editor.getSelectedText()
  editor.copySelectedText()

atom.commands.add 'atom-text-editor', 'custom:cut-line', ->
  editor = atom.workspace.getActiveTextEditor()
  editor.selectLinesContainingCursors() unless editor.getSelectedText()
  editor.cutSelectedText()
