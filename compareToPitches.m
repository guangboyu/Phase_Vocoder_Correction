%%This function takes an input frequency and outputs its nearest pitch in a
%%given table of pitches

function exactpitch = compareToPitches(pitch, pitchtable)

%%In case pitchtable is not sorted in ascending order
sortedpitchtable = sort(pitchtable); 

%%Pre-allocates memory for array
midpitchtable = zeros(1,length(sortedpitchtable)-1);

%%Boolean that indicates if the closest pitch to the input frequency has been found 
found = 0;

%%Generates a table of "average" pitches from pitchtable to make comparison easier.
%%log2(0.5) is used instead of 0.5 in order to account for logarithmic 
%%sound perception.
for i = 1:(length(sortedpitchtable)-1)
    midpitchtable(i) = (sortedpitchtable(i+1) - sortedpitchtable(i))*log2(0.5) + sortedpitchtable(i);
end

%%If input frequency is lower than the lowest pitch in the table, output
%%the lowest pitch in the table and set found to true.
if (pitch <= midpitchtable(1))
    exactpitch = sortedpitchtable(1);
    found = 1;
end

%%If exactpitch has not been found yet, and if input frequency is higher than the highest pitch in the table, output
%%the highest pitch in the table and set found to true.
if (found==0)
    if (pitch > midpitchtable(length(midpitchtable)))
        exactpitch = sortedpitchtable(length(sortedpitchtable));
        found = 1;
    end
end

%%If exactpitch has not been found yet, compare it to all values in the
%%midpitchtable and output the corresponding pitch in pitchtable. 
i = 1;
while(found==0)
    if(pitch > midpitchtable(i) && pitch <= midpitchtable(i+1))
        exactpitch = sortedpitchtable(i+1);
        found=1;
    end
    i = i+1;
end

end
