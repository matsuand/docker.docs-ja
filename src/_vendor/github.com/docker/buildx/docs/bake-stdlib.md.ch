%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Bake standard library functions
@y
title: Bake standard library functions
@z

@x
<!---MARKER_STDLIB_START-->
@y
<!---MARKER_STDLIB_START-->
@z

@x
| Name                                                | Description                                                                                                                                                                                                                                          |
|:----------------------------------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [`absolute`](#absolute)                             | If the given number is negative then returns its positive equivalent, or otherwise returns the given number unchanged.                                                                                                                               |
| [`add`](#add)                                       | Returns the sum of the two given numbers.                                                                                                                                                                                                            |
| [`and`](#and)                                       | Applies the logical AND operation to the given boolean values.                                                                                                                                                                                       |
| [`base64decode`](#base64decode)                     | Decodes a string containing a base64 sequence.                                                                                                                                                                                                       |
| [`base64encode`](#base64encode)                     | Encodes a string to a base64 sequence.                                                                                                                                                                                                               |
| [`basename`](#basename)                             | Returns the last element of a path.                                                                                                                                                                                                                  |
| [`bcrypt`](#bcrypt)                                 | Computes a hash of the given string using the Blowfish cipher.                                                                                                                                                                                       |
| [`byteslen`](#byteslen)                             | Returns the total number of bytes in the given buffer.                                                                                                                                                                                               |
| [`bytesslice`](#bytesslice)                         | Extracts a subslice from the given buffer.                                                                                                                                                                                                           |
| [`can`](#can)                                       | Tries to evaluate the expression given in its first argument.                                                                                                                                                                                        |
| [`ceil`](#ceil)                                     | Returns the smallest whole number that is greater than or equal to the given value.                                                                                                                                                                  |
| [`chomp`](#chomp)                                   | Removes one or more newline characters from the end of the given string.                                                                                                                                                                             |
| [`chunklist`](#chunklist)                           | Splits a single list into multiple lists where each has at most the given number of elements.                                                                                                                                                        |
| [`cidrhost`](#cidrhost)                             | Calculates a full host IP address within a given IP network address prefix.                                                                                                                                                                          |
| [`cidrnetmask`](#cidrnetmask)                       | Converts an IPv4 address prefix given in CIDR notation into a subnet mask address.                                                                                                                                                                   |
| [`cidrsubnet`](#cidrsubnet)                         | Calculates a subnet address within a given IP network address prefix.                                                                                                                                                                                |
| [`cidrsubnets`](#cidrsubnets)                       | Calculates many consecutive subnet addresses at once, rather than just a single subnet extension.                                                                                                                                                    |
| [`coalesce`](#coalesce)                             | Returns the first of the given arguments that isn't null, or raises an error if there are no non-null arguments.                                                                                                                                     |
| [`coalescelist`](#coalescelist)                     | Returns the first of the given sequences that has a length greater than zero.                                                                                                                                                                        |
| [`compact`](#compact)                               | Removes all empty string elements from the given list of strings.                                                                                                                                                                                    |
| [`concat`](#concat)                                 | Concatenates together all of the given lists or tuples into a single sequence, preserving the input order.                                                                                                                                           |
| [`contains`](#contains)                             | Returns true if the given value is a value in the given list, tuple, or set, or false otherwise.                                                                                                                                                     |
| [`convert`](#convert)                               | Converts a value to a specified type constraint, using HCL's customdecode extension for type expression support.                                                                                                                                     |
| [`csvdecode`](#csvdecode)                           | Parses the given string as Comma Separated Values (as defined by RFC 4180) and returns a map of objects representing the table of data, using the first row as a header row to define the object attributes.                                         |
| [`dirname`](#dirname)                               | Returns the directory of a path.                                                                                                                                                                                                                     |
| [`distinct`](#distinct)                             | Removes any duplicate values from the given list, preserving the order of remaining elements.                                                                                                                                                        |
| [`divide`](#divide)                                 | Divides the first given number by the second.                                                                                                                                                                                                        |
| [`element`](#element)                               | Returns the element with the given index from the given list or tuple, applying the modulo operation to the given index if it's greater than the number of elements.                                                                                 |
| [`equal`](#equal)                                   | Returns true if the two given values are equal, or false otherwise.                                                                                                                                                                                  |
| [`flatten`](#flatten)                               | Transforms a list, set, or tuple value into a tuple by replacing any given elements that are themselves sequences with a flattened tuple of all of the nested elements concatenated together.                                                        |
| [`floor`](#floor)                                   | Returns the greatest whole number that is less than or equal to the given value.                                                                                                                                                                     |
| [`format`](#format)                                 | Constructs a string by applying formatting verbs to a series of arguments, using a similar syntax to the C function \"printf\".                                                                                                                      |
| [`formatdate`](#formatdate)                         | Deprecated: use formattimestamp instead. Formats a timestamp given in RFC 3339 syntax into another timestamp in some other machine-oriented time syntax, as described in the format string.                                                          |
| [`formatlist`](#formatlist)                         | Constructs a list of strings by applying formatting verbs to a series of arguments, using a similar syntax to the C function \"printf\".                                                                                                             |
| [`formattimestamp`](#formattimestamp)               | Formats a timestamp string in RFC 3339 syntax or a unix timestamp integer into another timestamp in some other machine-oriented time syntax, as described in the format string. The special format string "X" returns the unix timestamp in seconds. |
| [`greaterthan`](#greaterthan)                       | Returns true if and only if the second number is greater than the first.                                                                                                                                                                             |
| [`greaterthanorequalto`](#greaterthanorequalto)     | Returns true if and only if the second number is greater than or equal to the first.                                                                                                                                                                 |
| [`hasindex`](#hasindex)                             | Returns true if if the given collection can be indexed with the given key without producing an error, or false otherwise.                                                                                                                            |
| [`homedir`](#homedir)                               | Returns the current user's home directory.                                                                                                                                                                                                           |
| [`indent`](#indent)                                 | Adds a given number of spaces after each newline character in the given string.                                                                                                                                                                      |
| [`index`](#index)                                   | Returns the element with the given key from the given collection, or raises an error if there is no such element.                                                                                                                                    |
| [`indexof`](#indexof)                               | Finds the element index for a given value in a list.                                                                                                                                                                                                 |
| [`int`](#int)                                       | Discards any fractional portion of the given number.                                                                                                                                                                                                 |
| [`join`](#join)                                     | Concatenates together the elements of all given lists with a delimiter, producing a single string.                                                                                                                                                   |
| [`jsondecode`](#jsondecode)                         | Parses the given string as JSON and returns a value corresponding to what the JSON document describes.                                                                                                                                               |
| [`jsonencode`](#jsonencode)                         | Returns a string containing a JSON representation of the given value.                                                                                                                                                                                |
| [`keys`](#keys)                                     | Returns a list of the keys of the given map in lexicographical order.                                                                                                                                                                                |
| [`length`](#length)                                 | Returns the number of elements in the given collection.                                                                                                                                                                                              |
| [`lessthan`](#lessthan)                             | Returns true if and only if the second number is less than the first.                                                                                                                                                                                |
| [`lessthanorequalto`](#lessthanorequalto)           | Returns true if and only if the second number is less than or equal to the first.                                                                                                                                                                    |
| [`log`](#log)                                       | Returns the logarithm of the given number in the given base.                                                                                                                                                                                         |
| [`lookup`](#lookup)                                 | Returns the value of the element with the given key from the given map, or returns the default value if there is no such element.                                                                                                                    |
| [`lower`](#lower)                                   | Returns the given string with all Unicode letters translated to their lowercase equivalents.                                                                                                                                                         |
| [`max`](#max)                                       | Returns the numerically greatest of all of the given numbers.                                                                                                                                                                                        |
| [`md5`](#md5)                                       | Computes the MD5 hash of a given string and encodes it with hexadecimal digits.                                                                                                                                                                      |
| [`merge`](#merge)                                   | Merges all of the elements from the given maps into a single map, or the attributes from given objects into a single object.                                                                                                                         |
| [`min`](#min)                                       | Returns the numerically smallest of all of the given numbers.                                                                                                                                                                                        |
| [`modulo`](#modulo)                                 | Divides the first given number by the second and then returns the remainder.                                                                                                                                                                         |
| [`multiply`](#multiply)                             | Returns the product of the two given numbers.                                                                                                                                                                                                        |
| [`negate`](#negate)                                 | Multiplies the given number by -1.                                                                                                                                                                                                                   |
| [`not`](#not)                                       | Applies the logical NOT operation to the given boolean value.                                                                                                                                                                                        |
| [`notequal`](#notequal)                             | Returns false if the two given values are equal, or true otherwise.                                                                                                                                                                                  |
| [`or`](#or)                                         | Applies the logical OR operation to the given boolean values.                                                                                                                                                                                        |
| [`parseint`](#parseint)                             | Parses the given string as a number of the given base, or raises an error if the string contains invalid characters.                                                                                                                                 |
| [`pow`](#pow)                                       | Returns the given number raised to the given power (exponentiation).                                                                                                                                                                                 |
| [`range`](#range)                                   | Returns a list of numbers spread evenly over a particular range.                                                                                                                                                                                     |
| [`regex`](#regex)                                   | Applies the given regular expression pattern to the given string and returns information about a single match, or raises an error if there is no match.                                                                                              |
| [`regex_replace`](#regex_replace)                   | Applies the given regular expression pattern to the given string and replaces all matches with the given replacement string.                                                                                                                         |
| [`regexall`](#regexall)                             | Applies the given regular expression pattern to the given string and returns a list of information about all non-overlapping matches, or an empty list if there are no matches.                                                                      |
| [`replace`](#replace)                               | Replaces all instances of the given substring in the given string with the given replacement string.                                                                                                                                                 |
| [`reverse`](#reverse)                               | Returns the given string with all of its Unicode characters in reverse order.                                                                                                                                                                        |
| [`reverselist`](#reverselist)                       | Returns the given list with its elements in reverse order.                                                                                                                                                                                           |
| [`rsadecrypt`](#rsadecrypt)                         | Decrypts an RSA-encrypted ciphertext.                                                                                                                                                                                                                |
| [`sanitize`](#sanitize)                             | Replaces all non-alphanumeric characters with a underscore, leaving only characters that are valid for a Bake target name.                                                                                                                           |
| [`semvercmp`](#semvercmp)                           | Returns true if version satisfies a constraint.                                                                                                                                                                                                      |
| [`sethaselement`](#sethaselement)                   | Returns true if the given set contains the given element, or false otherwise.                                                                                                                                                                        |
| [`setintersection`](#setintersection)               | Returns the intersection of all given sets.                                                                                                                                                                                                          |
| [`setproduct`](#setproduct)                         | Calculates the cartesian product of two or more sets.                                                                                                                                                                                                |
| [`setsubtract`](#setsubtract)                       | Returns the relative complement of the two given sets.                                                                                                                                                                                               |
| [`setsymmetricdifference`](#setsymmetricdifference) | Returns the symmetric difference of the two given sets.                                                                                                                                                                                              |
| [`setunion`](#setunion)                             | Returns the union of all given sets.                                                                                                                                                                                                                 |
| [`sha1`](#sha1)                                     | Computes the SHA1 hash of a given string and encodes it with hexadecimal digits.                                                                                                                                                                     |
| [`sha256`](#sha256)                                 | Computes the SHA256 hash of a given string and encodes it with hexadecimal digits.                                                                                                                                                                   |
| [`sha512`](#sha512)                                 | Computes the SHA512 hash of a given string and encodes it with hexadecimal digits.                                                                                                                                                                   |
| [`signum`](#signum)                                 | Returns 0 if the given number is zero, 1 if the given number is positive, or -1 if the given number is negative.                                                                                                                                     |
| [`slice`](#slice)                                   | Extracts a subslice of the given list or tuple value.                                                                                                                                                                                                |
| [`sort`](#sort)                                     | Applies a lexicographic sort to the elements of the given list.                                                                                                                                                                                      |
| [`split`](#split)                                   | Produces a list of one or more strings by splitting the given string at all instances of a given separator substring.                                                                                                                                |
| [`strlen`](#strlen)                                 | Returns the number of Unicode characters (technically: grapheme clusters) in the given string.                                                                                                                                                       |
| [`substr`](#substr)                                 | Extracts a substring from the given string.                                                                                                                                                                                                          |
| [`subtract`](#subtract)                             | Returns the difference between the two given numbers.                                                                                                                                                                                                |
| [`timeadd`](#timeadd)                               | Adds the duration represented by the given duration string to the given RFC 3339 timestamp string, returning another RFC 3339 timestamp.                                                                                                             |
| [`timestamp`](#timestamp)                           | Returns a string representation of the current date and time.                                                                                                                                                                                        |
| [`title`](#title)                                   | Replaces one letter after each non-letter and non-digit character with its uppercase equivalent.                                                                                                                                                     |
| [`trim`](#trim)                                     | Removes consecutive sequences of characters in "cutset" from the start and end of the given string.                                                                                                                                                  |
| [`trimprefix`](#trimprefix)                         | Removes the given prefix from the start of the given string, if present.                                                                                                                                                                             |
| [`trimspace`](#trimspace)                           | Removes any consecutive space characters (as defined by Unicode) from the start and end of the given string.                                                                                                                                         |
| [`trimsuffix`](#trimsuffix)                         | Removes the given suffix from the start of the given string, if present.                                                                                                                                                                             |
| [`try`](#try)                                       | Variadic function that tries to evaluate all of is arguments in sequence until one succeeds, in which case it returns that result, or returns an error if none of them succeed.                                                                      |
| [`unixtimestampparse`](#unixtimestampparse)         | Given a unix timestamp integer, will parse and return an object representation of that date and time. A unix timestamp is the number of seconds elapsed since January 1, 1970 UTC.                                                                   |
| [`upper`](#upper)                                   | Returns the given string with all Unicode letters translated to their uppercase equivalents.                                                                                                                                                         |
| [`urlencode`](#urlencode)                           | Applies URL encoding to a given string.                                                                                                                                                                                                              |
| [`uuidv4`](#uuidv4)                                 | Generates and returns a Type-4 UUID in the standard hexadecimal string format.                                                                                                                                                                       |
| [`uuidv5`](#uuidv5)                                 | Generates and returns a Type-5 UUID in the standard hexadecimal string format.                                                                                                                                                                       |
| [`values`](#values)                                 | Returns the values of elements of a given map, or the values of attributes of a given object, in lexicographic order by key or attribute name.                                                                                                       |
| [`zipmap`](#zipmap)                                 | Constructs a map from a list of keys and a corresponding list of values, which must both be of the same length.                                                                                                                                      |
@y
| Name                                                | Description                                                                                                                                                                                                                                          |
|:----------------------------------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [`absolute`](#absolute)                             | If the given number is negative then returns its positive equivalent, or otherwise returns the given number unchanged.                                                                                                                               |
| [`add`](#add)                                       | Returns the sum of the two given numbers.                                                                                                                                                                                                            |
| [`and`](#and)                                       | Applies the logical AND operation to the given boolean values.                                                                                                                                                                                       |
| [`base64decode`](#base64decode)                     | Decodes a string containing a base64 sequence.                                                                                                                                                                                                       |
| [`base64encode`](#base64encode)                     | Encodes a string to a base64 sequence.                                                                                                                                                                                                               |
| [`basename`](#basename)                             | Returns the last element of a path.                                                                                                                                                                                                                  |
| [`bcrypt`](#bcrypt)                                 | Computes a hash of the given string using the Blowfish cipher.                                                                                                                                                                                       |
| [`byteslen`](#byteslen)                             | Returns the total number of bytes in the given buffer.                                                                                                                                                                                               |
| [`bytesslice`](#bytesslice)                         | Extracts a subslice from the given buffer.                                                                                                                                                                                                           |
| [`can`](#can)                                       | Tries to evaluate the expression given in its first argument.                                                                                                                                                                                        |
| [`ceil`](#ceil)                                     | Returns the smallest whole number that is greater than or equal to the given value.                                                                                                                                                                  |
| [`chomp`](#chomp)                                   | Removes one or more newline characters from the end of the given string.                                                                                                                                                                             |
| [`chunklist`](#chunklist)                           | Splits a single list into multiple lists where each has at most the given number of elements.                                                                                                                                                        |
| [`cidrhost`](#cidrhost)                             | Calculates a full host IP address within a given IP network address prefix.                                                                                                                                                                          |
| [`cidrnetmask`](#cidrnetmask)                       | Converts an IPv4 address prefix given in CIDR notation into a subnet mask address.                                                                                                                                                                   |
| [`cidrsubnet`](#cidrsubnet)                         | Calculates a subnet address within a given IP network address prefix.                                                                                                                                                                                |
| [`cidrsubnets`](#cidrsubnets)                       | Calculates many consecutive subnet addresses at once, rather than just a single subnet extension.                                                                                                                                                    |
| [`coalesce`](#coalesce)                             | Returns the first of the given arguments that isn't null, or raises an error if there are no non-null arguments.                                                                                                                                     |
| [`coalescelist`](#coalescelist)                     | Returns the first of the given sequences that has a length greater than zero.                                                                                                                                                                        |
| [`compact`](#compact)                               | Removes all empty string elements from the given list of strings.                                                                                                                                                                                    |
| [`concat`](#concat)                                 | Concatenates together all of the given lists or tuples into a single sequence, preserving the input order.                                                                                                                                           |
| [`contains`](#contains)                             | Returns true if the given value is a value in the given list, tuple, or set, or false otherwise.                                                                                                                                                     |
| [`convert`](#convert)                               | Converts a value to a specified type constraint, using HCL's customdecode extension for type expression support.                                                                                                                                     |
| [`csvdecode`](#csvdecode)                           | Parses the given string as Comma Separated Values (as defined by RFC 4180) and returns a map of objects representing the table of data, using the first row as a header row to define the object attributes.                                         |
| [`dirname`](#dirname)                               | Returns the directory of a path.                                                                                                                                                                                                                     |
| [`distinct`](#distinct)                             | Removes any duplicate values from the given list, preserving the order of remaining elements.                                                                                                                                                        |
| [`divide`](#divide)                                 | Divides the first given number by the second.                                                                                                                                                                                                        |
| [`element`](#element)                               | Returns the element with the given index from the given list or tuple, applying the modulo operation to the given index if it's greater than the number of elements.                                                                                 |
| [`equal`](#equal)                                   | Returns true if the two given values are equal, or false otherwise.                                                                                                                                                                                  |
| [`flatten`](#flatten)                               | Transforms a list, set, or tuple value into a tuple by replacing any given elements that are themselves sequences with a flattened tuple of all of the nested elements concatenated together.                                                        |
| [`floor`](#floor)                                   | Returns the greatest whole number that is less than or equal to the given value.                                                                                                                                                                     |
| [`format`](#format)                                 | Constructs a string by applying formatting verbs to a series of arguments, using a similar syntax to the C function \"printf\".                                                                                                                      |
| [`formatdate`](#formatdate)                         | Deprecated: use formattimestamp instead. Formats a timestamp given in RFC 3339 syntax into another timestamp in some other machine-oriented time syntax, as described in the format string.                                                          |
| [`formatlist`](#formatlist)                         | Constructs a list of strings by applying formatting verbs to a series of arguments, using a similar syntax to the C function \"printf\".                                                                                                             |
| [`formattimestamp`](#formattimestamp)               | Formats a timestamp string in RFC 3339 syntax or a unix timestamp integer into another timestamp in some other machine-oriented time syntax, as described in the format string. The special format string "X" returns the unix timestamp in seconds. |
| [`greaterthan`](#greaterthan)                       | Returns true if and only if the second number is greater than the first.                                                                                                                                                                             |
| [`greaterthanorequalto`](#greaterthanorequalto)     | Returns true if and only if the second number is greater than or equal to the first.                                                                                                                                                                 |
| [`hasindex`](#hasindex)                             | Returns true if if the given collection can be indexed with the given key without producing an error, or false otherwise.                                                                                                                            |
| [`homedir`](#homedir)                               | Returns the current user's home directory.                                                                                                                                                                                                           |
| [`indent`](#indent)                                 | Adds a given number of spaces after each newline character in the given string.                                                                                                                                                                      |
| [`index`](#index)                                   | Returns the element with the given key from the given collection, or raises an error if there is no such element.                                                                                                                                    |
| [`indexof`](#indexof)                               | Finds the element index for a given value in a list.                                                                                                                                                                                                 |
| [`int`](#int)                                       | Discards any fractional portion of the given number.                                                                                                                                                                                                 |
| [`join`](#join)                                     | Concatenates together the elements of all given lists with a delimiter, producing a single string.                                                                                                                                                   |
| [`jsondecode`](#jsondecode)                         | Parses the given string as JSON and returns a value corresponding to what the JSON document describes.                                                                                                                                               |
| [`jsonencode`](#jsonencode)                         | Returns a string containing a JSON representation of the given value.                                                                                                                                                                                |
| [`keys`](#keys)                                     | Returns a list of the keys of the given map in lexicographical order.                                                                                                                                                                                |
| [`length`](#length)                                 | Returns the number of elements in the given collection.                                                                                                                                                                                              |
| [`lessthan`](#lessthan)                             | Returns true if and only if the second number is less than the first.                                                                                                                                                                                |
| [`lessthanorequalto`](#lessthanorequalto)           | Returns true if and only if the second number is less than or equal to the first.                                                                                                                                                                    |
| [`log`](#log)                                       | Returns the logarithm of the given number in the given base.                                                                                                                                                                                         |
| [`lookup`](#lookup)                                 | Returns the value of the element with the given key from the given map, or returns the default value if there is no such element.                                                                                                                    |
| [`lower`](#lower)                                   | Returns the given string with all Unicode letters translated to their lowercase equivalents.                                                                                                                                                         |
| [`max`](#max)                                       | Returns the numerically greatest of all of the given numbers.                                                                                                                                                                                        |
| [`md5`](#md5)                                       | Computes the MD5 hash of a given string and encodes it with hexadecimal digits.                                                                                                                                                                      |
| [`merge`](#merge)                                   | Merges all of the elements from the given maps into a single map, or the attributes from given objects into a single object.                                                                                                                         |
| [`min`](#min)                                       | Returns the numerically smallest of all of the given numbers.                                                                                                                                                                                        |
| [`modulo`](#modulo)                                 | Divides the first given number by the second and then returns the remainder.                                                                                                                                                                         |
| [`multiply`](#multiply)                             | Returns the product of the two given numbers.                                                                                                                                                                                                        |
| [`negate`](#negate)                                 | Multiplies the given number by -1.                                                                                                                                                                                                                   |
| [`not`](#not)                                       | Applies the logical NOT operation to the given boolean value.                                                                                                                                                                                        |
| [`notequal`](#notequal)                             | Returns false if the two given values are equal, or true otherwise.                                                                                                                                                                                  |
| [`or`](#or)                                         | Applies the logical OR operation to the given boolean values.                                                                                                                                                                                        |
| [`parseint`](#parseint)                             | Parses the given string as a number of the given base, or raises an error if the string contains invalid characters.                                                                                                                                 |
| [`pow`](#pow)                                       | Returns the given number raised to the given power (exponentiation).                                                                                                                                                                                 |
| [`range`](#range)                                   | Returns a list of numbers spread evenly over a particular range.                                                                                                                                                                                     |
| [`regex`](#regex)                                   | Applies the given regular expression pattern to the given string and returns information about a single match, or raises an error if there is no match.                                                                                              |
| [`regex_replace`](#regex_replace)                   | Applies the given regular expression pattern to the given string and replaces all matches with the given replacement string.                                                                                                                         |
| [`regexall`](#regexall)                             | Applies the given regular expression pattern to the given string and returns a list of information about all non-overlapping matches, or an empty list if there are no matches.                                                                      |
| [`replace`](#replace)                               | Replaces all instances of the given substring in the given string with the given replacement string.                                                                                                                                                 |
| [`reverse`](#reverse)                               | Returns the given string with all of its Unicode characters in reverse order.                                                                                                                                                                        |
| [`reverselist`](#reverselist)                       | Returns the given list with its elements in reverse order.                                                                                                                                                                                           |
| [`rsadecrypt`](#rsadecrypt)                         | Decrypts an RSA-encrypted ciphertext.                                                                                                                                                                                                                |
| [`sanitize`](#sanitize)                             | Replaces all non-alphanumeric characters with a underscore, leaving only characters that are valid for a Bake target name.                                                                                                                           |
| [`semvercmp`](#semvercmp)                           | Returns true if version satisfies a constraint.                                                                                                                                                                                                      |
| [`sethaselement`](#sethaselement)                   | Returns true if the given set contains the given element, or false otherwise.                                                                                                                                                                        |
| [`setintersection`](#setintersection)               | Returns the intersection of all given sets.                                                                                                                                                                                                          |
| [`setproduct`](#setproduct)                         | Calculates the cartesian product of two or more sets.                                                                                                                                                                                                |
| [`setsubtract`](#setsubtract)                       | Returns the relative complement of the two given sets.                                                                                                                                                                                               |
| [`setsymmetricdifference`](#setsymmetricdifference) | Returns the symmetric difference of the two given sets.                                                                                                                                                                                              |
| [`setunion`](#setunion)                             | Returns the union of all given sets.                                                                                                                                                                                                                 |
| [`sha1`](#sha1)                                     | Computes the SHA1 hash of a given string and encodes it with hexadecimal digits.                                                                                                                                                                     |
| [`sha256`](#sha256)                                 | Computes the SHA256 hash of a given string and encodes it with hexadecimal digits.                                                                                                                                                                   |
| [`sha512`](#sha512)                                 | Computes the SHA512 hash of a given string and encodes it with hexadecimal digits.                                                                                                                                                                   |
| [`signum`](#signum)                                 | Returns 0 if the given number is zero, 1 if the given number is positive, or -1 if the given number is negative.                                                                                                                                     |
| [`slice`](#slice)                                   | Extracts a subslice of the given list or tuple value.                                                                                                                                                                                                |
| [`sort`](#sort)                                     | Applies a lexicographic sort to the elements of the given list.                                                                                                                                                                                      |
| [`split`](#split)                                   | Produces a list of one or more strings by splitting the given string at all instances of a given separator substring.                                                                                                                                |
| [`strlen`](#strlen)                                 | Returns the number of Unicode characters (technically: grapheme clusters) in the given string.                                                                                                                                                       |
| [`substr`](#substr)                                 | Extracts a substring from the given string.                                                                                                                                                                                                          |
| [`subtract`](#subtract)                             | Returns the difference between the two given numbers.                                                                                                                                                                                                |
| [`timeadd`](#timeadd)                               | Adds the duration represented by the given duration string to the given RFC 3339 timestamp string, returning another RFC 3339 timestamp.                                                                                                             |
| [`timestamp`](#timestamp)                           | Returns a string representation of the current date and time.                                                                                                                                                                                        |
| [`title`](#title)                                   | Replaces one letter after each non-letter and non-digit character with its uppercase equivalent.                                                                                                                                                     |
| [`trim`](#trim)                                     | Removes consecutive sequences of characters in "cutset" from the start and end of the given string.                                                                                                                                                  |
| [`trimprefix`](#trimprefix)                         | Removes the given prefix from the start of the given string, if present.                                                                                                                                                                             |
| [`trimspace`](#trimspace)                           | Removes any consecutive space characters (as defined by Unicode) from the start and end of the given string.                                                                                                                                         |
| [`trimsuffix`](#trimsuffix)                         | Removes the given suffix from the start of the given string, if present.                                                                                                                                                                             |
| [`try`](#try)                                       | Variadic function that tries to evaluate all of is arguments in sequence until one succeeds, in which case it returns that result, or returns an error if none of them succeed.                                                                      |
| [`unixtimestampparse`](#unixtimestampparse)         | Given a unix timestamp integer, will parse and return an object representation of that date and time. A unix timestamp is the number of seconds elapsed since January 1, 1970 UTC.                                                                   |
| [`upper`](#upper)                                   | Returns the given string with all Unicode letters translated to their uppercase equivalents.                                                                                                                                                         |
| [`urlencode`](#urlencode)                           | Applies URL encoding to a given string.                                                                                                                                                                                                              |
| [`uuidv4`](#uuidv4)                                 | Generates and returns a Type-4 UUID in the standard hexadecimal string format.                                                                                                                                                                       |
| [`uuidv5`](#uuidv5)                                 | Generates and returns a Type-5 UUID in the standard hexadecimal string format.                                                                                                                                                                       |
| [`values`](#values)                                 | Returns the values of elements of a given map, or the values of attributes of a given object, in lexicographic order by key or attribute name.                                                                                                       |
| [`zipmap`](#zipmap)                                 | Constructs a map from a list of keys and a corresponding list of values, which must both be of the same length.                                                                                                                                      |
@z

@x
<!---MARKER_STDLIB_END-->
@y
<!---MARKER_STDLIB_END-->
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

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${distinct([1,2,2,3,3,3])}" # => [1,2,3]
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${distinct([1,2,2,3,3,3])}" # => [1,2,3]
  }
}
```
@z

@x
## `divide`
@y
## `divide`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${divide(10, 2)}" # => 5
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${divide(10, 2)}" # => 5
  }
}
```
@z

@x
## `element`
@y
## `element`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    val = "${element(["a","b","c"], 1)}" # => "b"
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    val = "${element(["a","b","c"], 1)}" # => "b"
  }
}
```
@z

@x
## `equal`
@y
## `equal`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    check = "${equal(2, 2)}" # => true
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    check = "${equal(2, 2)}" # => true
  }
}
```
@z

@x
## `flatten`
@y
## `flatten`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    flat = "${flatten([[1,2],[3,4],[5]])}" # => [1,2,3,4,5]
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    flat = "${flatten([[1,2],[3,4],[5]])}" # => [1,2,3,4,5]
  }
}
```
@z

@x
## `floor`
@y
## `floor`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${floor(3.99)}" # => 3
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${floor(3.99)}" # => 3
  }
}
```
@z

@x
## `format`
@y
## `format`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${format("Hello, %s!", "World")}" # => "Hello, World!"
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${format("Hello, %s!", "World")}" # => "Hello, World!"
  }
}
```
@z

@x
## `formatdate`
@y
## `formatdate`
@z

@x
> [!WARNING]
> Deprecated: use `formattimestamp` instead. `formatdate` only accepts RFC3339
> timestamp strings.
@y
> [!WARNING]
> Deprecated: use `formattimestamp` instead. `formatdate` only accepts RFC3339
> timestamp strings.
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    date = "${formatdate("YYYY-MM-DD", "2025-09-16T12:00:00Z")}" # => "2025-09-16"
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    date = "${formatdate("YYYY-MM-DD", "2025-09-16T12:00:00Z")}" # => "2025-09-16"
  }
}
```
@z

@x
## `formattimestamp`
@y
## `formattimestamp`
@z

@x
Formats either an RFC3339 timestamp string or a unix timestamp integer.
The special format `X` returns the unix timestamp in seconds.
@y
Formats either an RFC3339 timestamp string or a unix timestamp integer.
The special format `X` returns the unix timestamp in seconds.
@z

@x
```hcl
# docker-bake.hcl
variable "SOURCE_DATE_EPOCH" {
  type    = number
  default = formattimestamp("X", "2015-10-21T00:00:00Z") # => 1445385600
}
@y
```hcl
# docker-bake.hcl
variable "SOURCE_DATE_EPOCH" {
  type    = number
  default = formattimestamp("X", "2015-10-21T00:00:00Z") # => 1445385600
}
@z

@x
target "default" {
  dockerfile = "Dockerfile"
  labels = {
    "org.opencontainers.image.created" = formattimestamp("YYYY-MM-DD'T'hh:mm:ssZ", SOURCE_DATE_EPOCH) # => "2015-10-21T00:00:00Z"
  }
  args = {
    build_date = formattimestamp("YYYY-MM-DD", "2025-09-16T12:00:00Z") # => "2025-09-16"
  }
}
```
@y
target "default" {
  dockerfile = "Dockerfile"
  labels = {
    "org.opencontainers.image.created" = formattimestamp("YYYY-MM-DD'T'hh:mm:ssZ", SOURCE_DATE_EPOCH) # => "2015-10-21T00:00:00Z"
  }
  args = {
    build_date = formattimestamp("YYYY-MM-DD", "2025-09-16T12:00:00Z") # => "2025-09-16"
  }
}
```
@z

@x
## `formatlist`
@y
## `formatlist`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    list = "${formatlist("Hi %s", ["Alice", "Bob"])}" # => ["Hi Alice","Hi Bob"]
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    list = "${formatlist("Hi %s", ["Alice", "Bob"])}" # => ["Hi Alice","Hi Bob"]
  }
}
```
@z

@x
## `greaterthan`
@y
## `greaterthan`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${greaterthan(2, 5)}" # => true
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${greaterthan(2, 5)}" # => true
  }
}
```
@z

@x
## `greaterthanorequalto`
@y
## `greaterthanorequalto`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${greaterthanorequalto(5, 5)}" # => true
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${greaterthanorequalto(5, 5)}" # => true
  }
}
```
@z

@x
## `hasindex`
@y
## `hasindex`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    exists = "${hasindex([10, 20, 30], 1)}"  # => true
    missing = "${hasindex([10, 20, 30], 5)}" # => false
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    exists = "${hasindex([10, 20, 30], 1)}"  # => true
    missing = "${hasindex([10, 20, 30], 5)}" # => false
  }
}
```
@z

@x
## `homedir`
@y
## `homedir`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    home = "${homedir()}" # => e.g., "/home/user"
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    home = "${homedir()}" # => e.g., "/home/user"
  }
}
```
@z

@x
## `indent`
@y
## `indent`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    text = "${indent(4, "Hello\nWorld")}" 
    # => "    Hello\n    World"
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    text = "${indent(4, "Hello\nWorld")}" 
    # => "    Hello\n    World"
  }
}
```
@z

@x
## `index`
@y
## `index`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    val = "${index({foo = "bar", baz = "qux"}, "baz")}" # => "qux"
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    val = "${index({foo = "bar", baz = "qux"}, "baz")}" # => "qux"
  }
}
```
@z

@x
## `indexof`
@y
## `indexof`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    pos = "${indexof(["a","b","c"], "b")}" # => 1
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    pos = "${indexof(["a","b","c"], "b")}" # => 1
  }
}
```
@z

@x
## `int`
@y
## `int`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    number = "${int(3.75)}" # => 3
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    number = "${int(3.75)}" # => 3
  }
}
```
@z

@x
## `join`
@y
## `join`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    csv = "${join(",", ["a","b","c"])}" # => "a,b,c"
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    csv = "${join(",", ["a","b","c"])}" # => "a,b,c"
  }
}
```
@z

@x
## `jsondecode`
@y
## `jsondecode`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    obj = "${jsondecode("{\"name\":\"Docker\",\"stars\":5}")}" # => {"name":"Docker","stars":5}
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    obj = "${jsondecode("{\"name\":\"Docker\",\"stars\":5}")}" # => {"name":"Docker","stars":5}
  }
}
```
@z

@x
## `jsonencode`
@y
## `jsonencode`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    str = "${jsonencode({name="Docker", stars=5})}" # => "{\"name\":\"Docker\",\"stars\":5}"
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    str = "${jsonencode({name="Docker", stars=5})}" # => "{\"name\":\"Docker\",\"stars\":5}"
  }
}
```
@z

@x
## `keys`
@y
## `keys`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    list = "${keys({foo = 1, bar = 2, baz = 3})}" 
    # => ["bar","baz","foo"] (sorted order)
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    list = "${keys({foo = 1, bar = 2, baz = 3})}" 
    # => ["bar","baz","foo"] (sorted order)
  }
}
```
@z

@x
## `length`
@y
## `length`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    size = "${length([1,2,3,4])}" # => 4
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    size = "${length([1,2,3,4])}" # => 4
  }
}
```
@z

@x
## `lessthan`
@y
## `lessthan`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${lessthan(10, 3)}" # => false
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${lessthan(10, 3)}" # => false
  }
}
```
@z

@x
## `lessthanorequalto`
@y
## `lessthanorequalto`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${lessthanorequalto(5, 7)}" # => true
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${lessthanorequalto(5, 7)}" # => true
  }
}
```
@z

@x
## `log`
@y
## `log`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    val = "${log(100, 10)}" # => 2
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    val = "${log(100, 10)}" # => 2
  }
}
```
@z

@x
## `lookup`
@y
## `lookup`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    found    = "${lookup({a="apple", b="banana"}, "a", "none")}" # => "apple"
    fallback = "${lookup({a="apple", b="banana"}, "c", "none")}" # => "none"
  }
}
```
## `lower`
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    found    = "${lookup({a="apple", b="banana"}, "a", "none")}" # => "apple"
    fallback = "${lookup({a="apple", b="banana"}, "c", "none")}" # => "none"
  }
}
```
## `lower`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    val = "${lower("HELLO")}" # => "hello"
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    val = "${lower("HELLO")}" # => "hello"
  }
}
```
@z

@x
## `max`
@y
## `max`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${max(3, 9, 7)}" # => 9
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${max(3, 9, 7)}" # => 9
  }
}
```
@z

@x
## `md5`
@y
## `md5`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    hash = "${md5("docker")}" # => "597dd5f6a..." (hex string)
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    hash = "${md5("docker")}" # => "597dd5f6a..." (hex string)
  }
}
```
@z

@x
## `merge`
@y
## `merge`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    combined = "${merge({a=1, b=2}, {b=3, c=4})}" # => {a=1, b=3, c=4}
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    combined = "${merge({a=1, b=2}, {b=3, c=4})}" # => {a=1, b=3, c=4}
  }
}
```
@z

@x
## `min`
@y
## `min`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${min(3, 9, 7)}" # => 3
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${min(3, 9, 7)}" # => 3
  }
}
```
@z

@x
## `modulo`
@y
## `modulo`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${modulo(10, 3)}" # => 1
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${modulo(10, 3)}" # => 1
  }
}
```
@z

@x
## `multiply`
@y
## `multiply`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${multiply(6, 7)}" # => 42
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${multiply(6, 7)}" # => 42
  }
}
```
@z

@x
## `negate`
@y
## `negate`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${negate(7)}" # => -7
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${negate(7)}" # => -7
  }
}
```
@z

@x
## `not`
@y
## `not`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${not(true)}" # => false
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${not(true)}" # => false
  }
}
```
@z

@x
## `notequal`
@y
## `notequal`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${notequal(4, 5)}" # => true
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${notequal(4, 5)}" # => true
  }
}
```
@z

@x
## `or`
@y
## `or`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${or(true, false)}" # => true
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${or(true, false)}" # => true
  }
}
```
@z

@x
## `parseint`
@y
## `parseint`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${parseint("ff", 16)}" # => 255
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${parseint("ff", 16)}" # => 255
  }
}
```
@z

@x
## `pow`
@y
## `pow`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${pow(3, 2)}" # => 9
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${pow(3, 2)}" # => 9
  }
}
```
@z

@x
## `range`
@y
## `range`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${range(0, 5)}" # => [0,1,2,3,4]
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${range(0, 5)}" # => [0,1,2,3,4]
  }
}
```
@z

@x
## `regex`
@y
## `regex`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${regex("h.llo", "hello")}" # => "hello"
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${regex("h.llo", "hello")}" # => "hello"
  }
}
```
@z

@x
## `regex_replace`
@y
## `regex_replace`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${regex_replace("[0-9]+", "abc123xyz", "NUM")}" # => "abcNUMxyz"
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${regex_replace("[0-9]+", "abc123xyz", "NUM")}" # => "abcNUMxyz"
  }
}
```
@z

@x
## `regexall`
@y
## `regexall`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = matches = "${regexall("[a-z]+", "abc123xyz")}" # => ["abc","xyz"]
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = matches = "${regexall("[a-z]+", "abc123xyz")}" # => ["abc","xyz"]
  }
}
```
@z

@x
## `replace`
@y
## `replace`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${replace("banana", "na", "--")}" # => "ba-- --"
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${replace("banana", "na", "--")}" # => "ba-- --"
  }
}
```
@z

@x
## `reverse`
@y
## `reverse`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${reverse("stressed")}" # => "desserts"
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${reverse("stressed")}" # => "desserts"
  }
}
```
@z

@x
## `reverselist`
@y
## `reverselist`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${reverselist([1,2,3])}" # => [3,2,1]
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${reverselist([1,2,3])}" # => [3,2,1]
  }
}
```
@z

@x
## `rsadecrypt`
@y
## `rsadecrypt`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${rsadecrypt("eczGaDhXDbOFRZ...", "MIIEowIBAAKCAQEAgUElV5...")}"
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${rsadecrypt("eczGaDhXDbOFRZ...", "MIIEowIBAAKCAQEAgUElV5...")}"
  }
}
```
@z

@x
## `sanitize`
@y
## `sanitize`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${sanitize("My App! v1.0")}" # => "My_App__v1_0"
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${sanitize("My App! v1.0")}" # => "My_App__v1_0"
  }
}
```
@z

@x
## `semvercmp`
@y
## `semvercmp`
@z

@x
This function checks if a semantic version fits within a set of constraints.
See [Checking Version Constraints](https://github.com/Masterminds/semver?tab=readme-ov-file#checking-version-constraints)
for details.
@y
This function checks if a semantic version fits within a set of constraints.
See [Checking Version Constraints](https://github.com/Masterminds/semver?tab=readme-ov-file#checking-version-constraints)
for details.
@z

@x
```hcl
# docker-bake.hcl
variable "ALPINE_VERSION" {
  default = "3.23"
}
@y
```hcl
# docker-bake.hcl
variable "ALPINE_VERSION" {
  default = "3.23"
}
@z

@x
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  platforms = semvercmp(ALPINE_VERSION, ">= 3.20") ? [
    "linux/amd64",
    "linux/arm64",
    "linux/riscv64"
  ] : [
    "linux/amd64",
    "linux/arm64"
  ]
}
```
@y
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  platforms = semvercmp(ALPINE_VERSION, ">= 3.20") ? [
    "linux/amd64",
    "linux/arm64",
    "linux/riscv64"
  ] : [
    "linux/amd64",
    "linux/arm64"
  ]
}
```
@z

@x
## `sethaselement`
@y
## `sethaselement`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${sethaselement([1,2,3], 2)}"  # => true
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${sethaselement([1,2,3], 2)}"  # => true
  }
}
```
@z

@x
## `setintersection`
@y
## `setintersection`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${setintersection(["a","b","c"], ["b","c","d"])}" # => ["b","c"]
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${setintersection(["a","b","c"], ["b","c","d"])}" # => ["b","c"]
  }
}
```
@z

@x
## `setproduct`
@y
## `setproduct`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${setproduct(["x","y"], [1,2])}" # => [["x",1],["x",2],["y",1],["y",2]]
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${setproduct(["x","y"], [1,2])}" # => [["x",1],["x",2],["y",1],["y",2]]
  }
}
```
@z

@x
## `setsubtract`
@y
## `setsubtract`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${setsubtract([1,2,3], [2])}" # => [1,3]
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${setsubtract([1,2,3], [2])}" # => [1,3]
  }
}
```
@z

@x
## `setsymmetricdifference`
@y
## `setsymmetricdifference`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${setsymmetricdifference([1,2,3], [3,4])}" # => [1,2,4]
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${setsymmetricdifference([1,2,3], [3,4])}" # => [1,2,4]
  }
}
```
@z

@x
## `setunion`
@y
## `setunion`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${setunion(["a","b"], ["b","c"])}" # => ["a","b","c"]
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${setunion(["a","b"], ["b","c"])}" # => ["a","b","c"]
  }
}
```
@z

@x
## `sha1`
@y
## `sha1`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${sha1("hello")}" # => "aaf4c61d..." (hex)
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${sha1("hello")}" # => "aaf4c61d..." (hex)
  }
}
```
@z

@x
## `sha256`
@y
## `sha256`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${sha256("hello")}" # => "2cf24dba..." (hex)
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${sha256("hello")}" # => "2cf24dba..." (hex)
  }
}
```
@z

@x
## `sha512`
@y
## `sha512`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${sha512("hello")}" # => "9b71d224..." (hex)
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${sha512("hello")}" # => "9b71d224..." (hex)
  }
}
```
@z

@x
## `signum`
@y
## `signum`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    zero = "${signum(0)}"    # => 0
    pos  = "${signum(12)}"   # => 1
    neg  = "${signum(-12)}"  # => -1
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    zero = "${signum(0)}"    # => 0
    pos  = "${signum(12)}"   # => 1
    neg  = "${signum(-12)}"  # => -1
  }
}
```
@z

@x
## `slice`
@y
## `slice`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${slice(["a","b","c","d"], 1, 3)}" # => ["b","c"]
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${slice(["a","b","c","d"], 1, 3)}" # => ["b","c"]
  }
}
```
@z

@x
## `sort`
@y
## `sort`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${sort(["b","c","a"])}" # => ["a","b","c"]
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${sort(["b","c","a"])}" # => ["a","b","c"]
  }
}
```
@z

@x
## `split`
@y
## `split`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${split(",", "a,b,c")}" # => ["a","b","c"]
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${split(",", "a,b,c")}" # => ["a","b","c"]
  }
}
```
@z

@x
## `strlen`
@y
## `strlen`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${strlen("Docker")}" # => 6
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${strlen("Docker")}" # => 6
  }
}
```
@z

@x
## `substr`
@y
## `substr`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${substr("abcdef", 2, 3)}" # => "cde"
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${substr("abcdef", 2, 3)}" # => "cde"
  }
}
```
@z

@x
## `subtract`
@y
## `subtract`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${subtract(10, 3)}" # => 7
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${subtract(10, 3)}" # => 7
  }
}
```
@z

@x
## `timeadd`
@y
## `timeadd`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${timeadd("2025-09-24T12:00:00Z", "1h30m")}" # => "2025-09-24T13:30:00Z"
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${timeadd("2025-09-24T12:00:00Z", "1h30m")}" # => "2025-09-24T13:30:00Z"
  }
}
```
@z

@x
## `timestamp`
@y
## `timestamp`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${timestamp()}" # => current RFC3339 time at evaluation
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${timestamp()}" # => current RFC3339 time at evaluation
  }
}
```
@z

@x
## `title`
@y
## `title`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${title("hello world-from_docker")}" # => "Hello World-From_Docker"
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${title("hello world-from_docker")}" # => "Hello World-From_Docker"
  }
}
```
@z

@x
## `trim`
@y
## `trim`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${trim("--hello--", "-")}" # => "hello"
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${trim("--hello--", "-")}" # => "hello"
  }
}
```
@z

@x
## `trimprefix`
@y
## `trimprefix`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${trimprefix("docker-build", "docker-")}" # => "build"
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${trimprefix("docker-build", "docker-")}" # => "build"
  }
}
```
@z

@x
## `trimspace`
@y
## `trimspace`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${trimspace("   hello   ")}" # => "hello"
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${trimspace("   hello   ")}" # => "hello"
  }
}
```
@z

@x
## `trimsuffix`
@y
## `trimsuffix`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${trimsuffix("filename.txt", ".txt")}" # => "filename"
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${trimsuffix("filename.txt", ".txt")}" # => "filename"
  }
}
```
@z

@x
## `try`
@y
## `try`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    # First expr errors (invalid hex), second succeeds → returns 255
    val1 = "${try(parseint("zz", 16), parseint("ff", 16))}" # => 255
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    # First expr errors (invalid hex), second succeeds → returns 255
    val1 = "${try(parseint("zz", 16), parseint("ff", 16))}" # => 255
@z

@x
    # First expr errors (missing key), fallback string is used
    val2 = "${try(index({a="apple"}, "b"), "fallback")}"    # => "fallback"
  }
}
```
@y
    # First expr errors (missing key), fallback string is used
    val2 = "${try(index({a="apple"}, "b"), "fallback")}"    # => "fallback"
  }
}
```
@z

@x
## `unixtimestampparse`
@y
## `unixtimestampparse`
@z

@x
The returned object has the following attributes:
* `year` (Number) The year for the unix timestamp.
* `year_day` (Number) The day of the year for the unix timestamp, in the range 1-365 for non-leap years, and 1-366 in leap years.
* `day` (Number) The day of the month for the unix timestamp.
* `month` (Number) The month of the year for the unix timestamp.
* `month_name` (String) The name of the month for the unix timestamp (ex. "January").
* `weekday` (Number) The day of the week for the unix timestamp.
* `weekday_name` (String) The name of the day for the unix timestamp (ex. "Sunday").
* `hour` (Number) The hour within the day for the unix timestamp, in the range 0-23.
* `minute` (Number) The minute offset within the hour for the unix timestamp, in the range 0-59.
* `second` (Number) The second offset within the minute for the unix timestamp, in the range 0-59.
* `rfc3339` (String) The RFC3339 format string.
* `iso_year` (Number) The ISO 8601 year number.
* `iso_week` (Number) The ISO 8601 week number.
@y
The returned object has the following attributes:
* `year` (Number) The year for the unix timestamp.
* `year_day` (Number) The day of the year for the unix timestamp, in the range 1-365 for non-leap years, and 1-366 in leap years.
* `day` (Number) The day of the month for the unix timestamp.
* `month` (Number) The month of the year for the unix timestamp.
* `month_name` (String) The name of the month for the unix timestamp (ex. "January").
* `weekday` (Number) The day of the week for the unix timestamp.
* `weekday_name` (String) The name of the day for the unix timestamp (ex. "Sunday").
* `hour` (Number) The hour within the day for the unix timestamp, in the range 0-23.
* `minute` (Number) The minute offset within the hour for the unix timestamp, in the range 0-59.
* `second` (Number) The second offset within the minute for the unix timestamp, in the range 0-59.
* `rfc3339` (String) The RFC3339 format string.
* `iso_year` (Number) The ISO 8601 year number.
* `iso_week` (Number) The ISO 8601 week number.
@z

@x
```hcl
# docker-bake.hcl
variable "SOURCE_DATE_EPOCH" {
  type    = number
  default = 1690328596
}
@y
```hcl
# docker-bake.hcl
variable "SOURCE_DATE_EPOCH" {
  type    = number
  default = 1690328596
}
@z

@x
target "default" {
  args = {
    SOURCE_DATE_EPOCH = SOURCE_DATE_EPOCH
  }
  labels = {
    "org.opencontainers.image.created" = unixtimestampparse(SOURCE_DATE_EPOCH).rfc3339
  }
}
```
@y
target "default" {
  args = {
    SOURCE_DATE_EPOCH = SOURCE_DATE_EPOCH
  }
  labels = {
    "org.opencontainers.image.created" = unixtimestampparse(SOURCE_DATE_EPOCH).rfc3339
  }
}
```
@z

@x
## `upper`
@y
## `upper`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${upper("hello")}" # => "HELLO"
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    result = "${upper("hello")}" # => "HELLO"
  }
}
```
@z

@x
## `urlencode`
@y
## `urlencode`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    url = "${urlencode("a b=c&d")}" # => "a+b%3Dc%26d"
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    url = "${urlencode("a b=c&d")}" # => "a+b%3Dc%26d"
  }
}
```
@z

@x
## `uuidv4`
@y
## `uuidv4`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    id = "${uuidv4()}" # => random v4 UUID each evaluation
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    id = "${uuidv4()}" # => random v4 UUID each evaluation
  }
}
```
@z

@x
## `uuidv5`
@y
## `uuidv5`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    # Uses the DNS namespace UUID per RFC 4122
    # "6ba7b810-9dad-11d1-80b4-00c04fd430c8"
    id = "${uuidv5("6ba7b810-9dad-11d1-80b4-00c04fd430c8", "example.com")}"
    # => always "9073926b-929f-31c2-abc9-fad77ae3e8eb" for "example.com"
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    # Uses the DNS namespace UUID per RFC 4122
    # "6ba7b810-9dad-11d1-80b4-00c04fd430c8"
    id = "${uuidv5("6ba7b810-9dad-11d1-80b4-00c04fd430c8", "example.com")}"
    # => always "9073926b-929f-31c2-abc9-fad77ae3e8eb" for "example.com"
  }
}
```
@z

@x
## `values`
@y
## `values`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    vals = "${values({a=1, c=3, b=2})}" # => [1,2,3] (ordered by key: a,b,c)
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    vals = "${values({a=1, c=3, b=2})}" # => [1,2,3] (ordered by key: a,b,c)
  }
}
```
@z

@x
## `zipmap`
@y
## `zipmap`
@z

@x
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    obj = "${zipmap(["name","stars"], ["Docker", 5])}" # => {name="Docker", stars=5}
  }
}
```
@y
```hcl
# docker-bake.hcl
target "webapp-dev" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp:latest"]
  args = {
    obj = "${zipmap(["name","stars"], ["Docker", 5])}" # => {name="Docker", stars=5}
  }
}
```
@z
