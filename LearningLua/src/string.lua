-- String

-- String C-like escapes
print("String \aescape \a\aexample")
print("String \bescape \b\bexample")
print("String \fescape \f\fexample")
print("String \nescape \n\nexample")
print("String \rescape \r\rexample")
print("String \tescape \t\texample")
print("String \vescape \v\vexample")
print("String escape example \\")
print("String escape example \"")
print("String escape example \'")
print("String escape example \'")
print("String escape example \'")


-- String format, similar to Java's String.format(), implementation from C printf
print(string.format( "Number: %d", 100))