# Biju's Memory - Cryptology applications
-------------------------------------------------------------------------------

## Content Archive

rotp.asm, ages.asm, columnar.asm, cache.asm - source code files <br>
README - the file that contains details about the structure and implementation

-------------------------------------------------------------------------------

## TASK ROTP <br>
In this task, the input data was taken first.
Then I created a label, in which I first determined the position
the desired index to access the key-specific character. I determined
each character separately, I added them in the corresponding registers and I
performed the xor operation. Then I added the result to the final register, and I did
resumed the process simulating a loop while there are still characters in the two
strings.


## TASK AGES <br>
In this task, the input data and
updated the counter for a decreasing iteration. Then under the label
We have determined the final age according to different cases.

calculate_ages
-> I accessed the current year and the year corresponding to the date of birth, I realized
the difference between the two years and I added the final result in the register
-> I then accessed the corresponding two months
-> if the month specific to the date of birth is longer than the current month
I applied a decrement
-> if the months are equal, I continued the reasoning, updating the age on
basis of days
-> if the above conditions are not met, I continued the iteration

update_date:
-> I accessed the values ​​of the corresponding two days
-> if the value of the year difference is 0, the iteration continues
-> if the specific date of birth is longer than the current day
I applied a decrement
-> then I treated the case if the date of birth is longer than the current date,
representing an invalid date
-> If not, continue the iteration
-> if the meter has reached the end, execution stops

invalid_date:
-> I added to the value of the register with the final age 0
-> the iteration continues

apply_decrement:
-> I accessed the value of the register with the determined final age
-> I decreased the value by 1
-> I added the final result in the register and continued the iteration

update_iterration:
-> I decremented the value of the register that contains the value of the counter
-> in case position 0 is not reached, the iteration is continued

## COLUMN TASK

Similarly, in this task, the data were first taken over
input. Based on these we determined the final encrypted string using a
the calculation formula for the current index of each character.

** esi + [edi + 4 * ecx] + [edx * len_cheie] **

columnar_transposition:
-> I initialized with 0 the value of the index specific to the characters in the string
encrypted end
-> we determined the value of the number of lines by dividing the two lengths
received as input
-> I initialized the counter needed to iterate through the key vector

key_iteration:
-> I accessed the value of the meter necessary for the instruction of the forum
-> I determined the key-specific offset by accessing the desired index
-> I initialized the counter needed to iterate through the haystack

haystack_iteration:
-> I accessed the value of the meter necessary for the instruction of the forum
-> I multiplied the value of the key length by the value of the meter
-> I calculated the final offset, within the eax register (final position a
the character we want to access)
-> if this offset exceeds the size of the haystack the iteration continues,
ignoring the character in that position
-> if not, I access the desired character from the haystack, and on the desired index
from the final string (ciphertext) I add that character
-> increase the index by one position
-> I'm updating the index

update_iterrations:
-> determine the value of the haystack-specific iteration counter
-> I increase the value
-> if I did not exceed the number of lines, the iteration continues
-> determine the value of the key iteration-specific counter
-> I increase the value
-> if I did not exceed the key length, the iteration continues

Because the number of registers is small, and in this task I needed
to update the values, I used three global variables in which
I kept the values ​​for the index and the counter.
