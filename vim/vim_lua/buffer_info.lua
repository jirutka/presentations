local b = vim.buffer()
print("Buffer info:")
print("Short name: " .. b.name)
print("Long name:  " .. b.fname)
print("Lines:      " .. #b)
print("Buffer #:   " .. b.number)
