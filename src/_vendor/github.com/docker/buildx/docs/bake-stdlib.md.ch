%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% snip 対応

@x
title: Bake standard library functions
@y
title: Bake standard library functions
@z

@x
| Name                                                | Description                                                                                                                                                                                                  |
|:----------------------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
@y
| Name                                                | Description                                                                                                                                                                                                  |
|:----------------------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
@z

@x
| [`absolute`](#absolute)                             | If the given number is negative then returns its positive equivalent, or otherwise returns the given number unchanged.                                                                                       |
| [`add`](#add)                                       | Returns the sum of the two given numbers.                                                                                                                                                                    |
| [`and`](#and)                                       | Applies the logical AND operation to the given boolean values.                                                                                                                                               |
| [`base64decode`](#base64decode)                     | Decodes a string containing a base64 sequence.                                                                                                                                                               |
| [`base64encode`](#base64encode)                     | Encodes a string to a base64 sequence.                                                                                                                                                                       |
@y
| [`absolute`](#absolute)                             | If the given number is negative then returns its positive equivalent, or otherwise returns the given number unchanged.                                                                                       |
| [`add`](#add)                                       | Returns the sum of the two given numbers.                                                                                                                                                                    |
| [`and`](#and)                                       | Applies the logical AND operation to the given boolean values.                                                                                                                                               |
| [`base64decode`](#base64decode)                     | Decodes a string containing a base64 sequence.                                                                                                                                                               |
| [`base64encode`](#base64encode)                     | Encodes a string to a base64 sequence.                                                                                                                                                                       |
@z

@x
| [`basename`](#basename)                             | Returns the last element of a path.                                                                                                                                                                          |
| [`bcrypt`](#bcrypt)                                 | Computes a hash of the given string using the Blowfish cipher.                                                                                                                                               |
| [`byteslen`](#byteslen)                             | Returns the total number of bytes in the given buffer.                                                                                                                                                       |
| [`bytesslice`](#bytesslice)                         | Extracts a subslice from the given buffer.                                                                                                                                                                   |
| [`can`](#can)                                       | Tries to evaluate the expression given in its first argument.                                                                                                                                                |
@y
| [`basename`](#basename)                             | Returns the last element of a path.                                                                                                                                                                          |
| [`bcrypt`](#bcrypt)                                 | Computes a hash of the given string using the Blowfish cipher.                                                                                                                                               |
| [`byteslen`](#byteslen)                             | Returns the total number of bytes in the given buffer.                                                                                                                                                       |
| [`bytesslice`](#bytesslice)                         | Extracts a subslice from the given buffer.                                                                                                                                                                   |
| [`can`](#can)                                       | Tries to evaluate the expression given in its first argument.                                                                                                                                                |
@z

@x
| [`ceil`](#ceil)                                     | Returns the smallest whole number that is greater than or equal to the given value.                                                                                                                          |
| [`chomp`](#chomp)                                   | Removes one or more newline characters from the end of the given string.                                                                                                                                     |
| [`chunklist`](#chunklist)                           | Splits a single list into multiple lists where each has at most the given number of elements.                                                                                                                |
| [`cidrhost`](#cidrhost)                             | Calculates a full host IP address within a given IP network address prefix.                                                                                                                                  |
| [`cidrnetmask`](#cidrnetmask)                       | Converts an IPv4 address prefix given in CIDR notation into a subnet mask address.                                                                                                                           |
@y
| [`ceil`](#ceil)                                     | Returns the smallest whole number that is greater than or equal to the given value.                                                                                                                          |
| [`chomp`](#chomp)                                   | Removes one or more newline characters from the end of the given string.                                                                                                                                     |
| [`chunklist`](#chunklist)                           | Splits a single list into multiple lists where each has at most the given number of elements.                                                                                                                |
| [`cidrhost`](#cidrhost)                             | Calculates a full host IP address within a given IP network address prefix.                                                                                                                                  |
| [`cidrnetmask`](#cidrnetmask)                       | Converts an IPv4 address prefix given in CIDR notation into a subnet mask address.                                                                                                                           |
@z

@x
| [`cidrsubnet`](#cidrsubnet)                         | Calculates a subnet address within a given IP network address prefix.                                                                                                                                        |
| [`cidrsubnets`](#cidrsubnets)                       | Calculates many consecutive subnet addresses at once, rather than just a single subnet extension.                                                                                                            |
| [`coalesce`](#coalesce)                             | Returns the first of the given arguments that isn't null, or raises an error if there are no non-null arguments.                                                                                             |
| [`coalescelist`](#coalescelist)                     | Returns the first of the given sequences that has a length greater than zero.                                                                                                                                |
| [`compact`](#compact)                               | Removes all empty string elements from the given list of strings.                                                                                                                                            |
@y
| [`cidrsubnet`](#cidrsubnet)                         | Calculates a subnet address within a given IP network address prefix.                                                                                                                                        |
| [`cidrsubnets`](#cidrsubnets)                       | Calculates many consecutive subnet addresses at once, rather than just a single subnet extension.                                                                                                            |
| [`coalesce`](#coalesce)                             | Returns the first of the given arguments that isn't null, or raises an error if there are no non-null arguments.                                                                                             |
| [`coalescelist`](#coalescelist)                     | Returns the first of the given sequences that has a length greater than zero.                                                                                                                                |
| [`compact`](#compact)                               | Removes all empty string elements from the given list of strings.                                                                                                                                            |
@z

@x
| [`concat`](#concat)                                 | Concatenates together all of the given lists or tuples into a single sequence, preserving the input order.                                                                                                   |
| [`contains`](#contains)                             | Returns true if the given value is a value in the given list, tuple, or set, or false otherwise.                                                                                                             |
| [`convert`](#convert)                               | Converts a value to a specified type constraint, using HCL's customdecode extension for type expression support.                                                                                             |
| [`csvdecode`](#csvdecode)                           | Parses the given string as Comma Separated Values (as defined by RFC 4180) and returns a map of objects representing the table of data, using the first row as a header row to define the object attributes. |
| [`dirname`](#dirname)                               | Returns the directory of a path.                                                                                                                                                                             |
@y
| [`concat`](#concat)                                 | Concatenates together all of the given lists or tuples into a single sequence, preserving the input order.                                                                                                   |
| [`contains`](#contains)                             | Returns true if the given value is a value in the given list, tuple, or set, or false otherwise.                                                                                                             |
| [`convert`](#convert)                               | Converts a value to a specified type constraint, using HCL's customdecode extension for type expression support.                                                                                             |
| [`csvdecode`](#csvdecode)                           | Parses the given string as Comma Separated Values (as defined by RFC 4180) and returns a map of objects representing the table of data, using the first row as a header row to define the object attributes. |
| [`dirname`](#dirname)                               | Returns the directory of a path.                                                                                                                                                                             |
@z

@x
| [`distinct`](#distinct)                             | Removes any duplicate values from the given list, preserving the order of remaining elements.                                                                                                                |
| [`divide`](#divide)                                 | Divides the first given number by the second.                                                                                                                                                                |
| [`element`](#element)                               | Returns the element with the given index from the given list or tuple, applying the modulo operation to the given index if it's greater than the number of elements.                                         |
| [`equal`](#equal)                                   | Returns true if the two given values are equal, or false otherwise.                                                                                                                                          |
| [`flatten`](#flatten)                               | Transforms a list, set, or tuple value into a tuple by replacing any given elements that are themselves sequences with a flattened tuple of all of the nested elements concatenated together.                |
@y
| [`distinct`](#distinct)                             | Removes any duplicate values from the given list, preserving the order of remaining elements.                                                                                                                |
| [`divide`](#divide)                                 | Divides the first given number by the second.                                                                                                                                                                |
| [`element`](#element)                               | Returns the element with the given index from the given list or tuple, applying the modulo operation to the given index if it's greater than the number of elements.                                         |
| [`equal`](#equal)                                   | Returns true if the two given values are equal, or false otherwise.                                                                                                                                          |
| [`flatten`](#flatten)                               | Transforms a list, set, or tuple value into a tuple by replacing any given elements that are themselves sequences with a flattened tuple of all of the nested elements concatenated together.                |
@z

@x
| [`floor`](#floor)                                   | Returns the greatest whole number that is less than or equal to the given value.                                                                                                                             |
| [`format`](#format)                                 | Constructs a string by applying formatting verbs to a series of arguments, using a similar syntax to the C function \"printf\".                                                                              |
| [`formatdate`](#formatdate)                         | Formats a timestamp given in RFC 3339 syntax into another timestamp in some other machine-oriented time syntax, as described in the format string.                                                           |
| [`formatlist`](#formatlist)                         | Constructs a list of strings by applying formatting verbs to a series of arguments, using a similar syntax to the C function \"printf\".                                                                     |
| [`greaterthan`](#greaterthan)                       | Returns true if and only if the second number is greater than the first.                                                                                                                                     |
@y
| [`floor`](#floor)                                   | Returns the greatest whole number that is less than or equal to the given value.                                                                                                                             |
| [`format`](#format)                                 | Constructs a string by applying formatting verbs to a series of arguments, using a similar syntax to the C function \"printf\".                                                                              |
| [`formatdate`](#formatdate)                         | Formats a timestamp given in RFC 3339 syntax into another timestamp in some other machine-oriented time syntax, as described in the format string.                                                           |
| [`formatlist`](#formatlist)                         | Constructs a list of strings by applying formatting verbs to a series of arguments, using a similar syntax to the C function \"printf\".                                                                     |
| [`greaterthan`](#greaterthan)                       | Returns true if and only if the second number is greater than the first.                                                                                                                                     |
@z

@x
| [`greaterthanorequalto`](#greaterthanorequalto)     | Returns true if and only if the second number is greater than or equal to the first.                                                                                                                         |
| [`hasindex`](#hasindex)                             | Returns true if if the given collection can be indexed with the given key without producing an error, or false otherwise.                                                                                    |
| [`homedir`](#homedir)                               | Returns the current user's home directory.                                                                                                                                                                   |
| [`indent`](#indent)                                 | Adds a given number of spaces after each newline character in the given string.                                                                                                                              |
| [`index`](#index)                                   | Returns the element with the given key from the given collection, or raises an error if there is no such element.                                                                                            |
@y
| [`greaterthanorequalto`](#greaterthanorequalto)     | Returns true if and only if the second number is greater than or equal to the first.                                                                                                                         |
| [`hasindex`](#hasindex)                             | Returns true if if the given collection can be indexed with the given key without producing an error, or false otherwise.                                                                                    |
| [`homedir`](#homedir)                               | Returns the current user's home directory.                                                                                                                                                                   |
| [`indent`](#indent)                                 | Adds a given number of spaces after each newline character in the given string.                                                                                                                              |
| [`index`](#index)                                   | Returns the element with the given key from the given collection, or raises an error if there is no such element.                                                                                            |
@z

@x
| [`indexof`](#indexof)                               | Finds the element index for a given value in a list.                                                                                                                                                         |
| [`int`](#int)                                       | Discards any fractional portion of the given number.                                                                                                                                                         |
| [`join`](#join)                                     | Concatenates together the elements of all given lists with a delimiter, producing a single string.                                                                                                           |
| [`jsondecode`](#jsondecode)                         | Parses the given string as JSON and returns a value corresponding to what the JSON document describes.                                                                                                       |
| [`jsonencode`](#jsonencode)                         | Returns a string containing a JSON representation of the given value.                                                                                                                                        |
@y
| [`indexof`](#indexof)                               | Finds the element index for a given value in a list.                                                                                                                                                         |
| [`int`](#int)                                       | Discards any fractional portion of the given number.                                                                                                                                                         |
| [`join`](#join)                                     | Concatenates together the elements of all given lists with a delimiter, producing a single string.                                                                                                           |
| [`jsondecode`](#jsondecode)                         | Parses the given string as JSON and returns a value corresponding to what the JSON document describes.                                                                                                       |
| [`jsonencode`](#jsonencode)                         | Returns a string containing a JSON representation of the given value.                                                                                                                                        |
@z

@x
| [`keys`](#keys)                                     | Returns a list of the keys of the given map in lexicographical order.                                                                                                                                        |
| [`length`](#length)                                 | Returns the number of elements in the given collection.                                                                                                                                                      |
| [`lessthan`](#lessthan)                             | Returns true if and only if the second number is less than the first.                                                                                                                                        |
| [`lessthanorequalto`](#lessthanorequalto)           | Returns true if and only if the second number is less than or equal to the first.                                                                                                                            |
| [`log`](#log)                                       | Returns the logarithm of the given number in the given base.                                                                                                                                                 |
@y
| [`keys`](#keys)                                     | Returns a list of the keys of the given map in lexicographical order.                                                                                                                                        |
| [`length`](#length)                                 | Returns the number of elements in the given collection.                                                                                                                                                      |
| [`lessthan`](#lessthan)                             | Returns true if and only if the second number is less than the first.                                                                                                                                        |
| [`lessthanorequalto`](#lessthanorequalto)           | Returns true if and only if the second number is less than or equal to the first.                                                                                                                            |
| [`log`](#log)                                       | Returns the logarithm of the given number in the given base.                                                                                                                                                 |
@z

@x
| [`lookup`](#lookup)                                 | Returns the value of the element with the given key from the given map, or returns the default value if there is no such element.                                                                            |
| [`lower`](#lower)                                   | Returns the given string with all Unicode letters translated to their lowercase equivalents.                                                                                                                 |
| [`max`](#max)                                       | Returns the numerically greatest of all of the given numbers.                                                                                                                                                |
| [`md5`](#md5)                                       | Computes the MD5 hash of a given string and encodes it with hexadecimal digits.                                                                                                                              |
| [`merge`](#merge)                                   | Merges all of the elements from the given maps into a single map, or the attributes from given objects into a single object.                                                                                 |
@y
| [`lookup`](#lookup)                                 | Returns the value of the element with the given key from the given map, or returns the default value if there is no such element.                                                                            |
| [`lower`](#lower)                                   | Returns the given string with all Unicode letters translated to their lowercase equivalents.                                                                                                                 |
| [`max`](#max)                                       | Returns the numerically greatest of all of the given numbers.                                                                                                                                                |
| [`md5`](#md5)                                       | Computes the MD5 hash of a given string and encodes it with hexadecimal digits.                                                                                                                              |
| [`merge`](#merge)                                   | Merges all of the elements from the given maps into a single map, or the attributes from given objects into a single object.                                                                                 |
@z

@x
| [`min`](#min)                                       | Returns the numerically smallest of all of the given numbers.                                                                                                                                                |
| [`modulo`](#modulo)                                 | Divides the first given number by the second and then returns the remainder.                                                                                                                                 |
| [`multiply`](#multiply)                             | Returns the product of the two given numbers.                                                                                                                                                                |
| [`negate`](#negate)                                 | Multiplies the given number by -1.                                                                                                                                                                           |
| [`not`](#not)                                       | Applies the logical NOT operation to the given boolean value.                                                                                                                                                |
@y
| [`min`](#min)                                       | Returns the numerically smallest of all of the given numbers.                                                                                                                                                |
| [`modulo`](#modulo)                                 | Divides the first given number by the second and then returns the remainder.                                                                                                                                 |
| [`multiply`](#multiply)                             | Returns the product of the two given numbers.                                                                                                                                                                |
| [`negate`](#negate)                                 | Multiplies the given number by -1.                                                                                                                                                                           |
| [`not`](#not)                                       | Applies the logical NOT operation to the given boolean value.                                                                                                                                                |
@z

@x
| [`notequal`](#notequal)                             | Returns false if the two given values are equal, or true otherwise.                                                                                                                                          |
| [`or`](#or)                                         | Applies the logical OR operation to the given boolean values.                                                                                                                                                |
| [`parseint`](#parseint)                             | Parses the given string as a number of the given base, or raises an error if the string contains invalid characters.                                                                                         |
| [`pow`](#pow)                                       | Returns the given number raised to the given power (exponentiation).                                                                                                                                         |
| [`range`](#range)                                   | Returns a list of numbers spread evenly over a particular range.                                                                                                                                             |
@y
| [`notequal`](#notequal)                             | Returns false if the two given values are equal, or true otherwise.                                                                                                                                          |
| [`or`](#or)                                         | Applies the logical OR operation to the given boolean values.                                                                                                                                                |
| [`parseint`](#parseint)                             | Parses the given string as a number of the given base, or raises an error if the string contains invalid characters.                                                                                         |
| [`pow`](#pow)                                       | Returns the given number raised to the given power (exponentiation).                                                                                                                                         |
| [`range`](#range)                                   | Returns a list of numbers spread evenly over a particular range.                                                                                                                                             |
@z

@x
| [`regex`](#regex)                                   | Applies the given regular expression pattern to the given string and returns information about a single match, or raises an error if there is no match.                                                      |
| [`regex_replace`](#regex_replace)                   | Applies the given regular expression pattern to the given string and replaces all matches with the given replacement string.                                                                                 |
| [`regexall`](#regexall)                             | Applies the given regular expression pattern to the given string and returns a list of information about all non-overlapping matches, or an empty list if there are no matches.                              |
| [`replace`](#replace)                               | Replaces all instances of the given substring in the given string with the given replacement string.                                                                                                         |
| [`reverse`](#reverse)                               | Returns the given string with all of its Unicode characters in reverse order.                                                                                                                                |
@y
| [`regex`](#regex)                                   | Applies the given regular expression pattern to the given string and returns information about a single match, or raises an error if there is no match.                                                      |
| [`regex_replace`](#regex_replace)                   | Applies the given regular expression pattern to the given string and replaces all matches with the given replacement string.                                                                                 |
| [`regexall`](#regexall)                             | Applies the given regular expression pattern to the given string and returns a list of information about all non-overlapping matches, or an empty list if there are no matches.                              |
| [`replace`](#replace)                               | Replaces all instances of the given substring in the given string with the given replacement string.                                                                                                         |
| [`reverse`](#reverse)                               | Returns the given string with all of its Unicode characters in reverse order.                                                                                                                                |
@z

@x
| [`reverselist`](#reverselist)                       | Returns the given list with its elements in reverse order.                                                                                                                                                   |
| [`rsadecrypt`](#rsadecrypt)                         | Decrypts an RSA-encrypted ciphertext.                                                                                                                                                                        |
| [`sanitize`](#sanitize)                             | Replaces all non-alphanumeric characters with a underscore, leaving only characters that are valid for a Bake target name.                                                                                   |
| [`sethaselement`](#sethaselement)                   | Returns true if the given set contains the given element, or false otherwise.                                                                                                                                |
| [`setintersection`](#setintersection)               | Returns the intersection of all given sets.                                                                                                                                                                  |
@y
| [`reverselist`](#reverselist)                       | Returns the given list with its elements in reverse order.                                                                                                                                                   |
| [`rsadecrypt`](#rsadecrypt)                         | Decrypts an RSA-encrypted ciphertext.                                                                                                                                                                        |
| [`sanitize`](#sanitize)                             | Replaces all non-alphanumeric characters with a underscore, leaving only characters that are valid for a Bake target name.                                                                                   |
| [`sethaselement`](#sethaselement)                   | Returns true if the given set contains the given element, or false otherwise.                                                                                                                                |
| [`setintersection`](#setintersection)               | Returns the intersection of all given sets.                                                                                                                                                                  |
@z

@x
| [`setproduct`](#setproduct)                         | Calculates the cartesian product of two or more sets.                                                                                                                                                        |
| [`setsubtract`](#setsubtract)                       | Returns the relative complement of the two given sets.                                                                                                                                                       |
| [`setsymmetricdifference`](#setsymmetricdifference) | Returns the symmetric difference of the two given sets.                                                                                                                                                      |
| [`setunion`](#setunion)                             | Returns the union of all given sets.                                                                                                                                                                         |
| [`sha1`](#sha1)                                     | Computes the SHA1 hash of a given string and encodes it with hexadecimal digits.                                                                                                                             |
@y
| [`setproduct`](#setproduct)                         | Calculates the cartesian product of two or more sets.                                                                                                                                                        |
| [`setsubtract`](#setsubtract)                       | Returns the relative complement of the two given sets.                                                                                                                                                       |
| [`setsymmetricdifference`](#setsymmetricdifference) | Returns the symmetric difference of the two given sets.                                                                                                                                                      |
| [`setunion`](#setunion)                             | Returns the union of all given sets.                                                                                                                                                                         |
| [`sha1`](#sha1)                                     | Computes the SHA1 hash of a given string and encodes it with hexadecimal digits.                                                                                                                             |
@z

@x
| [`sha256`](#sha256)                                 | Computes the SHA256 hash of a given string and encodes it with hexadecimal digits.                                                                                                                           |
| [`sha512`](#sha512)                                 | Computes the SHA512 hash of a given string and encodes it with hexadecimal digits.                                                                                                                           |
| [`signum`](#signum)                                 | Returns 0 if the given number is zero, 1 if the given number is positive, or -1 if the given number is negative.                                                                                             |
| [`slice`](#slice)                                   | Extracts a subslice of the given list or tuple value.                                                                                                                                                        |
| [`sort`](#sort)                                     | Applies a lexicographic sort to the elements of the given list.                                                                                                                                              |
@y
| [`sha256`](#sha256)                                 | Computes the SHA256 hash of a given string and encodes it with hexadecimal digits.                                                                                                                           |
| [`sha512`](#sha512)                                 | Computes the SHA512 hash of a given string and encodes it with hexadecimal digits.                                                                                                                           |
| [`signum`](#signum)                                 | Returns 0 if the given number is zero, 1 if the given number is positive, or -1 if the given number is negative.                                                                                             |
| [`slice`](#slice)                                   | Extracts a subslice of the given list or tuple value.                                                                                                                                                        |
| [`sort`](#sort)                                     | Applies a lexicographic sort to the elements of the given list.                                                                                                                                              |
@z

@x
| [`split`](#split)                                   | Produces a list of one or more strings by splitting the given string at all instances of a given separator substring.                                                                                        |
| [`strlen`](#strlen)                                 | Returns the number of Unicode characters (technically: grapheme clusters) in the given string.                                                                                                               |
| [`substr`](#substr)                                 | Extracts a substring from the given string.                                                                                                                                                                  |
| [`subtract`](#subtract)                             | Returns the difference between the two given numbers.                                                                                                                                                        |
| [`timeadd`](#timeadd)                               | Adds the duration represented by the given duration string to the given RFC 3339 timestamp string, returning another RFC 3339 timestamp.                                                                     |
@y
| [`split`](#split)                                   | Produces a list of one or more strings by splitting the given string at all instances of a given separator substring.                                                                                        |
| [`strlen`](#strlen)                                 | Returns the number of Unicode characters (technically: grapheme clusters) in the given string.                                                                                                               |
| [`substr`](#substr)                                 | Extracts a substring from the given string.                                                                                                                                                                  |
| [`subtract`](#subtract)                             | Returns the difference between the two given numbers.                                                                                                                                                        |
| [`timeadd`](#timeadd)                               | Adds the duration represented by the given duration string to the given RFC 3339 timestamp string, returning another RFC 3339 timestamp.                                                                     |
@z

@x
| [`timestamp`](#timestamp)                           | Returns a string representation of the current date and time.                                                                                                                                                |
| [`title`](#title)                                   | Replaces one letter after each non-letter and non-digit character with its uppercase equivalent.                                                                                                             |
| [`trim`](#trim)                                     | Removes consecutive sequences of characters in "cutset" from the start and end of the given string.                                                                                                          |
| [`trimprefix`](#trimprefix)                         | Removes the given prefix from the start of the given string, if present.                                                                                                                                     |
| [`trimspace`](#trimspace)                           | Removes any consecutive space characters (as defined by Unicode) from the start and end of the given string.                                                                                                 |
@y
| [`timestamp`](#timestamp)                           | Returns a string representation of the current date and time.                                                                                                                                                |
| [`title`](#title)                                   | Replaces one letter after each non-letter and non-digit character with its uppercase equivalent.                                                                                                             |
| [`trim`](#trim)                                     | Removes consecutive sequences of characters in "cutset" from the start and end of the given string.                                                                                                          |
| [`trimprefix`](#trimprefix)                         | Removes the given prefix from the start of the given string, if present.                                                                                                                                     |
| [`trimspace`](#trimspace)                           | Removes any consecutive space characters (as defined by Unicode) from the start and end of the given string.                                                                                                 |
@z

@x
| [`trimsuffix`](#trimsuffix)                         | Removes the given suffix from the start of the given string, if present.                                                                                                                                     |
| [`try`](#try)                                       | Variadic function that tries to evaluate all of is arguments in sequence until one succeeds, in which case it returns that result, or returns an error if none of them succeed.                              |
| [`upper`](#upper)                                   | Returns the given string with all Unicode letters translated to their uppercase equivalents.                                                                                                                 |
| [`urlencode`](#urlencode)                           | Applies URL encoding to a given string.                                                                                                                                                                      |
| [`uuidv4`](#uuidv4)                                 | Generates and returns a Type-4 UUID in the standard hexadecimal string format.                                                                                                                               |
@y
| [`trimsuffix`](#trimsuffix)                         | Removes the given suffix from the start of the given string, if present.                                                                                                                                     |
| [`try`](#try)                                       | Variadic function that tries to evaluate all of is arguments in sequence until one succeeds, in which case it returns that result, or returns an error if none of them succeed.                              |
| [`upper`](#upper)                                   | Returns the given string with all Unicode letters translated to their uppercase equivalents.                                                                                                                 |
| [`urlencode`](#urlencode)                           | Applies URL encoding to a given string.                                                                                                                                                                      |
| [`uuidv4`](#uuidv4)                                 | Generates and returns a Type-4 UUID in the standard hexadecimal string format.                                                                                                                               |
@z

@x
| [`uuidv5`](#uuidv5)                                 | Generates and returns a Type-5 UUID in the standard hexadecimal string format.                                                                                                                               |
| [`values`](#values)                                 | Returns the values of elements of a given map, or the values of attributes of a given object, in lexicographic order by key or attribute name.                                                               |
| [`zipmap`](#zipmap)                                 | Constructs a map from a list of keys and a corresponding list of values, which must both be of the same length.                                                                                              |
@y
| [`uuidv5`](#uuidv5)                                 | Generates and returns a Type-5 UUID in the standard hexadecimal string format.                                                                                                                               |
| [`values`](#values)                                 | Returns the values of elements of a given map, or the values of attributes of a given object, in lexicographic order by key or attribute name.                                                               |
| [`zipmap`](#zipmap)                                 | Constructs a map from a list of keys and a corresponding list of values, which must both be of the same length.                                                                                              |
@z

@x
## Examples
@y
## Examples
@z

@x
### <a name="absolute"></a> `absolute`
@y
### <a name="absolute"></a> `absolute`
@z

% snip code...

@x
### <a name="add"></a> `add`
@y
### <a name="add"></a> `add`
@z

% snip code...

@x
### <a name="and"></a> `and`
@y
### <a name="and"></a> `and`
@z

% snip code...

@x
### <a name="base64decode"></a> `base64decode`
@y
### <a name="base64decode"></a> `base64decode`
@z

% snip code...

@x
### <a name="base64encode"></a> `base64encode`
@y
### <a name="base64encode"></a> `base64encode`
@z

% snip code...

@x
### <a name="basename"></a> `basename`
@y
### <a name="basename"></a> `basename`
@z

% snip code...

@x
### <a name="bcrypt"></a> `bcrypt`
@y
### <a name="bcrypt"></a> `bcrypt`
@z

% snip code...

@x
### <a name="byteslen"></a> `byteslen`
@y
### <a name="byteslen"></a> `byteslen`
@z

% snip code...

@x
### <a name="bytesslice"></a> `bytesslice`
@y
### <a name="bytesslice"></a> `bytesslice`
@z

% snip code...

@x
### <a name="can"></a> `can`
@y
### <a name="can"></a> `can`
@z

% snip code...

@x
### <a name="ceil"></a> `ceil`
@y
### <a name="ceil"></a> `ceil`
@z

% snip code...

@x
### <a name="chomp"></a> `chomp`
@y
### <a name="chomp"></a> `chomp`
@z

% snip code...

@x
### <a name="chunklist"></a> `chunklist`
@y
### <a name="chunklist"></a> `chunklist`
@z

% snip code...

@x
### <a name="cidrhost"></a> `cidrhost`
@y
### <a name="cidrhost"></a> `cidrhost`
@z

% snip code...

@x
### <a name="cidrnetmask"></a> `cidrnetmask`
@y
### <a name="cidrnetmask"></a> `cidrnetmask`
@z

% snip code...

@x
### <a name="cidrsubnet"></a> `cidrsubnet`
@y
### <a name="cidrsubnet"></a> `cidrsubnet`
@z

% snip code...

@x
### <a name="cidrsubnets"></a> `cidrsubnets`
@y
### <a name="cidrsubnets"></a> `cidrsubnets`
@z

% snip code...

@x
### <a name="coalesce"></a> `coalesce`
@y
### <a name="coalesce"></a> `coalesce`
@z

% snip code...

@x
### <a name="coalescelist"></a> `coalescelist`
@y
### <a name="coalescelist"></a> `coalescelist`
@z

% snip code...

@x
### <a name="compact"></a> `compact`
@y
### <a name="compact"></a> `compact`
@z

% snip code...

@x
### <a name="concat"></a> `concat`
@y
### <a name="concat"></a> `concat`
@z

% snip code...

@x
### <a name="contains"></a> `contains`
@y
### <a name="contains"></a> `contains`
@z

% snip code...

@x
### <a name="convert"></a> `convert`
@y
### <a name="convert"></a> `convert`
@z

% snip code...

@x
### <a name="csvdecode"></a> `csvdecode`
@y
### <a name="csvdecode"></a> `csvdecode`
@z

% snip code...

@x
### <a name="dirname"></a> `dirname`
@y
### <a name="dirname"></a> `dirname`
@z

% snip code...

@x
### <a name="distinct"></a> `distinct`
@y
### <a name="distinct"></a> `distinct`
@z

% snip code...

@x
### <a name="divide"></a> `divide`
@y
### <a name="divide"></a> `divide`
@z

% snip code...

@x
### <a name="element"></a> `element`
@y
### <a name="element"></a> `element`
@z

% snip code...

@x
### <a name="equal"></a> `equal`
@y
### <a name="equal"></a> `equal`
@z

% snip code...

@x
### <a name="flatten"></a> `flatten`
@y
### <a name="flatten"></a> `flatten`
@z

% snip code...

@x
### <a name="floor"></a> `floor`
@y
### <a name="floor"></a> `floor`
@z

% snip code...

@x
### <a name="format"></a> `format`
@y
### <a name="format"></a> `format`
@z

% snip code...

@x
### <a name="formatdate"></a> `formatdate`
@y
### <a name="formatdate"></a> `formatdate`
@z

% snip code...

@x
### <a name="formatlist"></a> `formatlist`
@y
### <a name="formatlist"></a> `formatlist`
@z

% snip code...

@x
### <a name="greaterthan"></a> `greaterthan`
@y
### <a name="greaterthan"></a> `greaterthan`
@z

% snip code...

@x
### <a name="greaterthanorequalto"></a> `greaterthanorequalto`
@y
### <a name="greaterthanorequalto"></a> `greaterthanorequalto`
@z

% snip code...

@x
### <a name="hasindex"></a> `hasindex`
@y
### <a name="hasindex"></a> `hasindex`
@z

% snip code...

@x
### <a name="homedir"></a> `homedir`
@y
### <a name="homedir"></a> `homedir`
@z

% snip code...

@x
### <a name="indent"></a> `indent`
@y
### <a name="indent"></a> `indent`
@z

% snip code...

@x
### <a name="index"></a> `index`
@y
### <a name="index"></a> `index`
@z

% snip code...

@x
### <a name="indexof"></a> `indexof`
@y
### <a name="indexof"></a> `indexof`
@z

% snip code...

@x
### <a name="int"></a> `int`
@y
### <a name="int"></a> `int`
@z

% snip code...

@x
### <a name="join"></a> `join`
@y
### <a name="join"></a> `join`
@z

% snip code...

@x
### <a name="jsondecode"></a> `jsondecode`
@y
### <a name="jsondecode"></a> `jsondecode`
@z

% snip code...

@x
### <a name="jsonencode"></a> `jsonencode`
@y
### <a name="jsonencode"></a> `jsonencode`
@z

% snip code...

@x
### <a name="keys"></a> `keys`
@y
### <a name="keys"></a> `keys`
@z

% snip code...

@x
### <a name="length"></a> `length`
@y
### <a name="length"></a> `length`
@z

% snip code...

@x
### <a name="lessthan"></a> `lessthan`
@y
### <a name="lessthan"></a> `lessthan`
@z

% snip code...

@x
### <a name="lessthanorequalto"></a> `lessthanorequalto`
@y
### <a name="lessthanorequalto"></a> `lessthanorequalto`
@z

% snip code...

@x
### <a name="log"></a> `log`
@y
### <a name="log"></a> `log`
@z

% snip code...

@x
### <a name="lookup"></a> `lookup`
@y
### <a name="lookup"></a> `lookup`
@z

% snip code...

@x
### <a name="lower"></a> `lower`
@y
### <a name="lower"></a> `lower`
@z

% snip code...

@x
### <a name="max"></a> `max`
@y
### <a name="max"></a> `max`
@z

% snip code...

@x
### <a name="md5"></a> `md5`
@y
### <a name="md5"></a> `md5`
@z

% snip code...

@x
### <a name="merge"></a> `merge`
@y
### <a name="merge"></a> `merge`
@z

% snip code...

@x
### <a name="min"></a> `min`
@y
### <a name="min"></a> `min`
@z

% snip code...

@x
### <a name="modulo"></a> `modulo`
@y
### <a name="modulo"></a> `modulo`
@z

% snip code...

@x
### <a name="multiply"></a> `multiply`
@y
### <a name="multiply"></a> `multiply`
@z

% snip code...

@x
### <a name="negate"></a> `negate`
@y
### <a name="negate"></a> `negate`
@z

% snip code...

@x
### <a name="not"></a> `not`
@y
### <a name="not"></a> `not`
@z

% snip code...

@x
### <a name="notequal"></a> `notequal`
@y
### <a name="notequal"></a> `notequal`
@z

% snip code...

@x
### <a name="or"></a> `or`
@y
### <a name="or"></a> `or`
@z

% snip code...

@x
### <a name="parseint"></a> `parseint`
@y
### <a name="parseint"></a> `parseint`
@z

% snip code...

@x
### <a name="pow"></a> `pow`
@y
### <a name="pow"></a> `pow`
@z

% snip code...

@x
### <a name="range"></a> `range`
@y
### <a name="range"></a> `range`
@z

% snip code...

@x
### <a name="regex"></a> `regex`
@y
### <a name="regex"></a> `regex`
@z

% snip code...

@x
### <a name="regex_replace"></a> `regex_replace`
@y
### <a name="regex_replace"></a> `regex_replace`
@z

% snip code...

@x
### <a name="regexall"></a> `regexall`
@y
### <a name="regexall"></a> `regexall`
@z

% snip code...

@x
### <a name="replace"></a> `replace`
@y
### <a name="replace"></a> `replace`
@z

% snip code...

@x
### <a name="reverse"></a> `reverse`
@y
### <a name="reverse"></a> `reverse`
@z

% snip code...

@x
### <a name="reverselist"></a> `reverselist`
@y
### <a name="reverselist"></a> `reverselist`
@z

% snip code...

@x
### <a name="rsadecrypt"></a> `rsadecrypt`
@y
### <a name="rsadecrypt"></a> `rsadecrypt`
@z

% snip code...

@x
### <a name="sanitize"></a> `sanitize`
@y
### <a name="sanitize"></a> `sanitize`
@z

% snip code...

@x
### <a name="sethaselement"></a> `sethaselement`
@y
### <a name="sethaselement"></a> `sethaselement`
@z

% snip code...

@x
### <a name="setintersection"></a> `setintersection`
@y
### <a name="setintersection"></a> `setintersection`
@z

% snip code...

@x
### <a name="setproduct"></a> `setproduct`
@y
### <a name="setproduct"></a> `setproduct`
@z

% snip code...

@x
### <a name="setsubtract"></a> `setsubtract`
@y
### <a name="setsubtract"></a> `setsubtract`
@z

% snip code...

@x
### <a name="setsymmetricdifference"></a> `setsymmetricdifference`
@y
### <a name="setsymmetricdifference"></a> `setsymmetricdifference`
@z

% snip code...

@x
### <a name="setunion"></a> `setunion`
@y
### <a name="setunion"></a> `setunion`
@z

% snip code...

@x
### <a name="sha1"></a> `sha1`
@y
### <a name="sha1"></a> `sha1`
@z

% snip code...

@x
### <a name="sha256"></a> `sha256`
@y
### <a name="sha256"></a> `sha256`
@z

% snip code...

@x
### <a name="sha512"></a> `sha512`
@y
### <a name="sha512"></a> `sha512`
@z

% snip code...

@x
### <a name="signum"></a> `signum`
@y
### <a name="signum"></a> `signum`
@z

% snip code...

@x
### <a name="slice"></a> `slice`
@y
### <a name="slice"></a> `slice`
@z

% snip code...

@x
### <a name="sort"></a> `sort`
@y
### <a name="sort"></a> `sort`
@z

% snip code...

@x
### <a name="split"></a> `split`
@y
### <a name="split"></a> `split`
@z

% snip code...

@x
### <a name="strlen"></a> `strlen`
@y
### <a name="strlen"></a> `strlen`
@z

% snip code...

@x
### <a name="substr"></a> `substr`
@y
### <a name="substr"></a> `substr`
@z

% snip code...

@x
### <a name="subtract"></a> `subtract`
@y
### <a name="subtract"></a> `subtract`
@z

% snip code...

@x
### <a name="timeadd"></a> `timeadd`
@y
### <a name="timeadd"></a> `timeadd`
@z

% snip code...

@x
### <a name="timestamp"></a> `timestamp`
@y
### <a name="timestamp"></a> `timestamp`
@z

% snip code...

@x
### <a name="title"></a> `title`
@y
### <a name="title"></a> `title`
@z

% snip code...

@x
### <a name="trim"></a> `trim`
@y
### <a name="trim"></a> `trim`
@z

% snip code...

@x
### <a name="trimprefix"></a> `trimprefix`
@y
### <a name="trimprefix"></a> `trimprefix`
@z

% snip code...

@x
### <a name="trimspace"></a> `trimspace`
@y
### <a name="trimspace"></a> `trimspace`
@z

% snip code...

@x
### <a name="trimsuffix"></a> `trimsuffix`
@y
### <a name="trimsuffix"></a> `trimsuffix`
@z

% snip code...

@x
### <a name="try"></a> `try`
@y
### <a name="try"></a> `try`
@z

@x within code
    # First expr errors (invalid hex), second succeeds → returns 255
@y
    # First expr errors (invalid hex), second succeeds → returns 255
@z
@x
    # First expr errors (missing key), fallback string is used
@y
    # First expr errors (missing key), fallback string is used
@z

@x
### <a name="upper"></a> `upper`
@y
### <a name="upper"></a> `upper`
@z

% snip code...

@x
### <a name="urlencode"></a> `urlencode`
@y
### <a name="urlencode"></a> `urlencode`
@z

% snip code...

@x
### <a name="uuidv4"></a> `uuidv4`
@y
### <a name="uuidv4"></a> `uuidv4`
@z

% snip code...

@x
### <a name="uuidv5"></a> `uuidv5`
@y
### <a name="uuidv5"></a> `uuidv5`
@z

@x within code
    # Uses the DNS namespace UUID per RFC 4122
    # "6ba7b810-9dad-11d1-80b4-00c04fd430c8"
@y
    # Uses the DNS namespace UUID per RFC 4122
    # "6ba7b810-9dad-11d1-80b4-00c04fd430c8"
@z
@x
    # => always "9073926b-929f-31c2-abc9-fad77ae3e8eb" for "example.com"
@y
    # => always "9073926b-929f-31c2-abc9-fad77ae3e8eb" for "example.com"
@z

@x
### <a name="values"></a> `values`
@y
### <a name="values"></a> `values`
@z

% snip code...

@x
### <a name="zipmap"></a> `zipmap`
@y
### <a name="zipmap"></a> `zipmap`
@z

% snip code...
