# Biju's Memory - Cryptology applications
-------------------------------------------------------------------------------

Biju wants to be a hacker. This project simulates a series of cryptology applications used to encrypt a series of messages.

## Content Archive

rotp.asm, ages.asm, columnar.asm, cache.asm - source code files <br>
README - the file that contains details about the structure and implementation  <br>

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

calculate_ages  <br>
-> I accessed the current year and the year corresponding to the date of birth, I realized
the difference between the two years and I added the final result in the register  <br>
-> I then accessed the corresponding two months  <br>
-> if the month specific to the date of birth is longer than the current month
I applied a decrement  <br>
-> if the months are equal, I continued the reasoning, updating the age on
basis of days  <br>
-> if the above conditions are not met, I continued the iteration  <br>

update_date: <br>
-> I accessed the values ​​of the corresponding two days  <br>
-> if the value of the year difference is 0, the iteration continues  <br>
-> if the specific date of birth is longer than the current day
I applied a decrement  <br>
-> then I treated the case if the date of birth is longer than the current date,
representing an invalid date  <br>
-> If not, continue the iteration  <br>
-> if the meter has reached the end, execution stops  <br>

invalid_date:  <br>
-> I added to the value of the register with the final age 0  <br>
-> the iteration continues  <br>

apply_decrement:  <br>
-> I accessed the value of the register with the determined final age  <br>
-> I decreased the value by 1  <br>
-> I added the final result in the register and continued the iteration  <br>

update_iterration:  <br>
-> I decremented the value of the register that contains the value of the counter  <br>
-> in case position 0 is not reached, the iteration is continued  <br>

## COLUMN TASK

Similarly, in this task, the data were first taken over
input. Based on these we determined the final encrypted string using a
the calculation formula for the current index of each character.  <br>

** esi + [edi + 4 * ecx] + [edx * len_cheie] **  <br>

columnar_transposition:  <br>
-> I initialized with 0 the value of the index specific to the characters in the string
encrypted end  <br>
-> we determined the value of the number of lines by dividing the two lengths
received as input  <br>
-> I initialized the counter needed to iterate through the key vector  <br>

key_iteration:  <br>
-> I accessed the value of the meter necessary for the instruction of the forum  <br>
-> I determined the key-specific offset by accessing the desired index  <br>
-> I initialized the counter needed to iterate through the haystack <br>

haystack_iteration:  <br>
-> I accessed the value of the meter necessary for the instruction of the forum  <br>
-> I multiplied the value of the key length by the value of the meter  <br>
-> I calculated the final offset, within the eax register (final position a
the character we want to access)  <br>
-> if this offset exceeds the size of the haystack the iteration continues,
ignoring the character in that position  <br>
-> if not, I access the desired character from the haystack, and on the desired index
from the final string (ciphertext) I add that character  <br>
-> increase the index by one position  <br>
-> I'm updating the index  <br>

update_iterrations:  <br>
-> determine the value of the haystack-specific iteration counter  <br>
-> I increase the value  <br>
-> if I did not exceed the number of lines, the iteration continues  <br>
-> determine the value of the key iteration-specific counter  <br>
-> I increase the value  <br>
-> if I did not exceed the key length, the iteration continues  <br>

Because the number of registers is small, and in this task I needed
to update the values, I used three global variables in which
I kept the values ​​for the index and the counter.
