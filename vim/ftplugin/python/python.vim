" use za to open and close folds
set foldmethod=indent
set foldlevel=99

"" Use context auto-complete. See :help supertab
"let g:SuperTabDefaultCompletionType = "context"
"let g:SuperTabContextDefaultCompletionType = "<c-x><c-p>"

" use :make to run pylint on current file
"setlocal makeprg=pylint\ --output-format=parseable\ --reports=n\ %:p
setlocal makeprg=pylint\ --msg-template=\"{path}:{line}:\ [{msg_id}]\ {msg}\"\ --reports=n\ %:p
setlocal efm=%f:%l:\ [%t]%m,%f:%l:%m
function! WriteParams()
python << endpython
import re
import vim

# get the function definition line
line = vim.eval("getline(line('.'))")
# get the number of spaces to add to the start of the line
num_spaces = 4 + len(line) - len(line.lstrip())
# get the line number wher to do the insertion
line_number = int(vim.eval("line('.')"))

# find the parameter names in the function definition
params = re.findall("[\w=]+", line)[2:]

# the header and the footer of the doctstring
lines = ['"""', ""]

for param in params:
    # skip the 'self' since it doesn't have to be documented.
    if param == "self":
        continue
    # handle the default argument parameters
    if "=" in param:
        param_name = param.split('=')[0]
        param_default_value = "".join(param.split('=')[1:])
        lines.append(":param %s: (Default value: %s)" % (param_name, param_default_value))
        lines.append(":type %s:" % param_name)
    else:
        lines.append(":param %s:" % param)
        lines.append(":type %s:" % param)

lines.append(":returns:")
lines.append('"""')
# insert the contents of the list into the buffer
vim.current.buffer[:] = vim.current.buffer[:line_number] + [(" "*num_spaces)+line for line in lines] + vim.current.buffer[line_number:] 
endpython
endfunction

" Map <ctrl>+p to single line mode documentation (in insert and command mode)
inoremap <buffer> <C-P> :call WriteParams()<CR>i
nnoremap <buffer> <C-P> :call WriteParams()<CR>

" use F2 to add TODO comment
imap  <F2> # TODO(zheng): 
