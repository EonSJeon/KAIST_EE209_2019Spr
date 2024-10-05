20180569 Jeon Sangeon Assign3

1.
1) Using Array:
   Pros- Easy to resize
   Cons- Slow at searching. Function have to run through all the nodes
2) Using HashTable:
   Pros- Fast at searching
   Cons- Difficult to resize because we have to consider the data
	 which are already registered with previous hash_code
       - Complex when there's multiple hashtables point
	 to the same data. When unregisteration, we have to link all
	 the preious and next node of unregistered node in all hash tables

Personally, I support hash table because cons of hashtable can be improved
with the proper algorithm. For example, difficulty in resizing have been
overcome in my codes by modifying search function. Though it have to search
for the multiple hash code after resizing, it's much more efficient then look
through all the nodes.

2. I implemented hash table expansion. RegisterCustomer expands hash table
when the nodeNum exceeds 75% of current hash table size. Searching functions
(SearchByID, SearchByName) changed corresondingly. It searchs DB reducing
iBucketCount in hash_function to the half until the function finds the UserInfo
or iBucketCount becomes 1024.
Ex.
If current arrSize is 2^15, Searching function calls
hash_function(~, 2^15)
hash_function(~, 2^14)
hash_function(~, 2^13)
hash_function(~, 2^12)
and so on

3. I use strdup function for the both codes
