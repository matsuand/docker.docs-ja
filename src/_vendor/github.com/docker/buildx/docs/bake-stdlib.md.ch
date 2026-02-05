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
| [`semvercmp`](#semvercmp)                           | Returns true if version satisfies a constraint.                                                                                                                                                              |
| [`sethaselement`](#sethaselement)                   | Returns true if the given set contains the given element, or false otherwise.                                                                                                                                |
| [`setintersection`](#setintersection)               | Returns the intersection of all given sets.                                                                                                                                                                  |
@y
| [`reverselist`](#reverselist)                       | Returns the given list with its elements in reverse order.                                                                                                                                                   |
| [`rsadecrypt`](#rsadecrypt)                         | Decrypts an RSA-encrypted ciphertext.                                                                                                                                                                        |
| [`sanitize`](#sanitize)                             | Replaces all non-alphanumeric characters with a underscore, leaving only characters that are valid for a Bake target name.                                                                                   |
| [`semvercmp`](#semvercmp)                           | Returns true if version satisfies a constraint.                                                                                                                                                              |
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
## `absolute`
@y
## `absolute`
@z

% snip code...

@x
## `add`
@y
## `add`
@z

% snip code...

@x
## `and`
@y
## `and`
@z

% snip code...

@x
## `base64decode`
@y
## `base64decode`
@z

% snip code...

@x
## `base64encode`
@y
## `base64encode`
@z

% snip code...

@x
## `basename`
@y
## `basename`
@z

% snip code...

@x
## `bcrypt`
@y
## `bcrypt`
@z

% snip code...

@x
## `byteslen`
@y
## `byteslen`
@z

% snip code...

@x
## `bytesslice`
@y
## `bytesslice`
@z

% snip code...

@x
## `can`
@y
## `can`
@z

% snip code...

@x
## `ceil`
@y
## `ceil`
@z

% snip code...

@x
## `chomp`
@y
## `chomp`
@z

% snip code...

@x
## `chunklist`
@y
## `chunklist`
@z

% snip code...

@x
## `cidrhost`
@y
## `cidrhost`
@z

% snip code...

@x
## `cidrnetmask`
@y
## `cidrnetmask`
@z

% snip code...

@x
## `cidrsubnet`
@y
## `cidrsubnet`
@z

% snip code...

@x
## `cidrsubnets`
@y
## `cidrsubnets`
@z

% snip code...

@x
## `coalesce`
@y
## `coalesce`
@z

% snip code...

@x
## `coalescelist`
@y
## `coalescelist`
@z

% snip code...

@x
## `compact`
@y
## `compact`
@z

% snip code...

@x
## `concat`
@y
## `concat`
@z

% snip code...

@x
## `contains`
@y
## `contains`
@z

% snip code...

@x
## `convert`
@y
## `convert`
@z

% snip code...

@x
## `csvdecode`
@y
## `csvdecode`
@z

% snip code...

@x
## `dirname`
@y
## `dirname`
@z

% snip code...

@x
## `distinct`
@y
## `distinct`
@z

% snip code...

@x
## `divide`
@y
## `divide`
@z

% snip code...

@x
## `element`
@y
## `element`
@z

% snip code...

@x
## `equal`
@y
## `equal`
@z

% snip code...

@x
## `flatten`
@y
## `flatten`
@z

% snip code...

@x
## `floor`
@y
## `floor`
@z

% snip code...

@x
## `format`
@y
## `format`
@z

% snip code...

@x
## `formatdate`
@y
## `formatdate`
@z

% snip code...

@x
## `formatlist`
@y
## `formatlist`
@z

% snip code...

@x
## `greaterthan`
@y
## `greaterthan`
@z

% snip code...

@x
## `greaterthanorequalto`
@y
## `greaterthanorequalto`
@z

% snip code...

@x
## `hasindex`
@y
## `hasindex`
@z

% snip code...

@x
## `homedir`
@y
## `homedir`
@z

% snip code...

@x
## `indent`
@y
## `indent`
@z

% snip code...

@x
## `index`
@y
## `index`
@z

% snip code...

@x
## `indexof`
@y
## `indexof`
@z

% snip code...

@x
## `int`
@y
## `int`
@z

% snip code...

@x
## `join`
@y
## `join`
@z

% snip code...

@x
## `jsondecode`
@y
## `jsondecode`
@z

% snip code...

@x
## `jsonencode`
@y
## `jsonencode`
@z

% snip code...

@x
## `keys`
@y
## `keys`
@z

% snip code...

@x
## `length`
@y
## `length`
@z

% snip code...

@x
## `lessthan`
@y
## `lessthan`
@z

% snip code...

@x
## `lessthanorequalto`
@y
## `lessthanorequalto`
@z

% snip code...

@x
## `log`
@y
## `log`
@z

% snip code...

@x
## `lookup`
@y
## `lookup`
@z

% snip code...

@x
## `lower`
@y
## `lower`
@z

% snip code...

@x
## `max`
@y
## `max`
@z

% snip code...

@x
## `md5`
@y
## `md5`
@z

% snip code...

@x
## `merge`
@y
## `merge`
@z

% snip code...

@x
## `min`
@y
## `min`
@z

% snip code...

@x
## `modulo`
@y
## `modulo`
@z

% snip code...

@x
## `multiply`
@y
## `multiply`
@z

% snip code...

@x
## `negate`
@y
## `negate`
@z

% snip code...

@x
## `not`
@y
## `not`
@z

% snip code...

@x
## `notequal`
@y
## `notequal`
@z

% snip code...

@x
## `or`
@y
## `or`
@z

% snip code...

@x
## `parseint`
@y
## `parseint`
@z

% snip code...

@x
## `pow`
@y
## `pow`
@z

% snip code...

@x
## `range`
@y
## `range`
@z

% snip code...

@x
## `regex`
@y
## `regex`
@z

% snip code...

@x
## `regex_replace`
@y
## `regex_replace`
@z

% snip code...

@x
## `regexall`
@y
## `regexall`
@z

% snip code...

@x
## `replace`
@y
## `replace`
@z

% snip code...

@x
## `reverse`
@y
## `reverse`
@z

% snip code...

@x
## `reverselist`
@y
## `reverselist`
@z

% snip code...

@x
## `rsadecrypt`
@y
## `rsadecrypt`
@z

% snip code...

@x
## `sanitize`
@y
## `sanitize`
@z

% snip code...

@x
## `semvercmp`
@y
## `semvercmp`
@z

% snip code...

@x
## `sethaselement`
@y
## `sethaselement`
@z

% snip code...

@x
## `setintersection`
@y
## `setintersection`
@z

% snip code...

@x
## `setproduct`
@y
## `setproduct`
@z

% snip code...

@x
## `setsubtract`
@y
## `setsubtract`
@z

% snip code...

@x
## `setsymmetricdifference`
@y
## `setsymmetricdifference`
@z

% snip code...

@x
## `setunion`
@y
## `setunion`
@z

% snip code...

@x
## `sha1`
@y
## `sha1`
@z

% snip code...

@x
## `sha256`
@y
## `sha256`
@z

% snip code...

@x
## `sha512`
@y
## `sha512`
@z

% snip code...

@x
## `signum`
@y
## `signum`
@z

% snip code...

@x
## `slice`
@y
## `slice`
@z

% snip code...

@x
## `sort`
@y
## `sort`
@z

% snip code...

@x
## `split`
@y
## `split`
@z

% snip code...

@x
## `strlen`
@y
## `strlen`
@z

% snip code...

@x
## `substr`
@y
## `substr`
@z

% snip code...

@x
## `subtract`
@y
## `subtract`
@z

% snip code...

@x
## `timeadd`
@y
## `timeadd`
@z

% snip code...

@x
## `timestamp`
@y
## `timestamp`
@z

% snip code...

@x
## `title`
@y
## `title`
@z

% snip code...

@x
## `trim`
@y
## `trim`
@z

% snip code...

@x
## `trimprefix`
@y
## `trimprefix`
@z

% snip code...

@x
## `trimspace`
@y
## `trimspace`
@z

% snip code...

@x
## `trimsuffix`
@y
## `trimsuffix`
@z

% snip code...

@x
## `try`
@y
## `try`
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
## `upper`
@y
## `upper`
@z

% snip code...

@x
## `urlencode`
@y
## `urlencode`
@z

% snip code...

@x
## `uuidv4`
@y
## `uuidv4`
@z

% snip code...

@x
## `uuidv5`
@y
## `uuidv5`
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
## `values`
@y
## `values`
@z

% snip code...

@x
## `zipmap`
@y
## `zipmap`
@z

% snip code...
