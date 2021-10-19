Rem Creates three equal arrays of numbers and has them sorted with different sorting algorithms 
Rem to allow performance comparison via execution counting ("Collect Runtime Data" should 
Rem sensibly be switched on). 
Rem Requested input data are: Number of elements (size) and filing mode. 
Rem Generated by Structorizer 3.30-11 

Rem Copyright (C) 2019-10-02 Kay Gürtzig 
Rem License: GPLv3-link 
Rem GNU General Public License (V 3) 
Rem https://www.gnu.org/licenses/gpl.html 
Rem http://www.gnu.de/documents/gpl.de.html 

Rem  
Rem program SORTING_TEST_MAIN
Rem TODO: Check and accomplish your variable declarations here: 
Dim values3() As ???
Dim values2() As ???
Dim values1() As Integer
Dim show As ???
Dim ok3 As bool
Dim ok2 As bool
Dim ok1 As bool
Dim modus As ???
Dim i As Integer
Dim elementCount As ???
Rem  
Do
  INPUT elementCount
Loop Until elementCount >= 1
Do
  PRINT "Filling: 1 = random, 2 = increasing, 3 = decreasing"; : INPUT modus
Loop Until modus = 1 OR modus = 2 OR modus = 3
For i = 0 To elementCount-1
  Select Case modus
    Case 1
      values1(i) = random(10000)
    Case 2
      values1(i) = i
    Case 3
      values1(i) = -i
  End Select
Next i
Rem Copy the array for exact comparability 
For i = 0 To elementCount-1
  values2(i) = values1(i)
  values3(i) = values1(i)
Next i

Rem ========================================================== 
Rem ================= START PARALLEL SECTION ================= 
Rem ========================================================== 
Rem TODO: add the necessary code to run the threads concurrently 

  Rem ----------------- START THREAD 0 ----------------- 
    Call bubbleSort(values1)
  Rem ------------------ END THREAD 0 ------------------ 


  Rem ----------------- START THREAD 1 ----------------- 
    Call quickSort(values2, 0, elementCount)
  Rem ------------------ END THREAD 1 ------------------ 


  Rem ----------------- START THREAD 2 ----------------- 
    Call heapSort(values3)
  Rem ------------------ END THREAD 2 ------------------ 

Rem ========================================================== 
Rem ================== END PARALLEL SECTION ================== 
Rem ========================================================== 

ok1 = testSorted(values1)
ok2 = testSorted(values2)
ok3 = testSorted(values3)
If NOT ok1 OR NOT ok2 OR NOT ok3 Then
  For i = 0 To elementCount-1
    If values1(i) <> values2(i) OR values1(i) <> values3(i) Then
      PRINT "Difference at ["; i; "]: "; values1(i); " <-> "; values2(i); " <-> "; values3(i)
    End If
  Next i
End If
Do
  PRINT "Show arrays (yes/no)?"; : INPUT show
Loop Until show = "yes" OR show = "no"
If show = "yes" Then
  For i = 0 To elementCount - 1
    PRINT "["; i; "]:\t"; values1(i); "\t"; values2(i); "\t"; values3(i)
  Next i
End If
End
Rem  
Rem Implements the well-known BubbleSort algorithm. 
Rem Compares neigbouring elements and swaps them in case of an inversion. 
Rem Repeats this while inversions have been found. After every 
Rem loop passage at least one element (the largest one out of the 
Rem processed subrange) finds its final place at the end of the 
Rem subrange. 
Rem TODO: Check (and specify if needed) the argument and result types! 
Sub bubbleSort(values)
  Rem TODO: Check and accomplish your variable declarations here: 
  Dim temp As ???
  Dim posSwapped As ???
  Dim i As Integer
  Dim ende As ???
  Rem  
  ende = length(values) - 2
  Do
    Rem The index of the most recent swapping (-1 means no swapping done). 
    posSwapped = -1
    For i = 0 To ende
      If values(i) > values(i+1) Then
        temp = values(i)
        values(i) = values(i+1)
        values(i+1) = temp
        posSwapped = i
      End If
    Next i
    ende = posSwapped - 1
  Loop Until posSwapped < 0
End Sub
Rem  
Rem Given a max-heap 'heap´ with element at index 'i´ possibly 
Rem violating the heap property wrt. its subtree upto and including 
Rem index range-1, restores heap property in the subtree at index i 
Rem again. 
Rem TODO: Check (and specify if needed) the argument and result types! 
Sub maxHeapify(heap, i, range)
  Rem TODO: Check and accomplish your variable declarations here: 
  Dim temp As ???
  Dim right As ???
  Dim max As ???
  Dim left As ???
  Rem  
  Rem Indices of left and right child of node i 
  right = (i+1) * 2
  left = right - 1
  Rem Index of the (local) maximum 
  max = i
  If left < range AND heap(left) > heap(i) Then
    max = left
  End If
  If right < range AND heap(right) > heap(max) Then
    max = right
  End If
  If max <> i Then
    temp = heap(i)
    heap(i) = heap(max)
    heap(max) = temp
    Call maxHeapify(heap, max, range)
  End If
End Sub
Rem  
Rem Partitions array 'values´ between indices 'start´ und 'stop´-1 with 
Rem respect to the pivot element initially at index 'p´ into smaller 
Rem and greater elements. 
Rem Returns the new (and final) index of the pivot element (which 
Rem separates the sequence of smaller elements from the sequence 
Rem of greater elements). 
Rem This is not the most efficient algorithm (about half the swapping 
Rem might still be avoided) but it is pretty clear. 
Rem TODO: Check (and specify if needed) the argument and result types! 
Function partition(values, start, stop, p) As Integer
  Rem TODO: Check and accomplish your variable declarations here: 
  Dim seen As ???
  Dim pivot As ???
  Rem  
  Rem Cache the pivot element 
  pivot = values(p)
  Rem Exchange the pivot element with the start element 
  values(p) = values(start)
  values(start) = pivot
  p = start
  Rem Beginning and end of the remaining undiscovered range 
  start = start + 1
  stop = stop - 1
  Rem Still unseen elements? 
  Rem Loop invariants: 
  Rem 1. p = start - 1 
  Rem 2. pivot = values[p] 
  Rem 3. i < start → values[i] ≤ pivot 
  Rem 4. stop < i → pivot < values[i] 
  Do While start <= stop
    Rem Fetch the first element of the undiscovered area 
    seen = values(start)
    Rem Does the checked element belong to the smaller area? 
    If seen <= pivot Then
      Rem Insert the seen element between smaller area and pivot element 
      values(p) = seen
      values(start) = pivot
      Rem Shift the border between lower and undicovered area, 
      Rem update pivot position. 
      p = p + 1
      start = start + 1
    Else
      Rem Insert the checked element between undiscovered and larger area 
      values(start) = values(stop)
      values(stop) = seen
      Rem Shift the border between undiscovered and larger area 
      stop = stop - 1
    End If
  Loop
  return p
End Function
Rem  
Rem Checks whether or not the passed-in array is (ascendingly) sorted. 
Rem TODO: Check (and specify if needed) the argument and result types! 
Function testSorted(numbers) As bool
  Rem TODO: Check and accomplish your variable declarations here: 
  Dim isSorted As boolean
  Dim i As Integer
  Rem  
  isSorted = true
  i = 0
  Rem As we compare with the following element, we must stop at the penultimate index 
  Do While isSorted AND (i <= length(numbers)-2)
    Rem Is there an inversion? 
    If numbers(i) > numbers(i+1) Then
      isSorted = false
    Else
      i = i + 1
    End If
  Loop
  return isSorted
End Function
Rem  
Rem Runs through the array heap and converts it to a max-heap 
Rem in a bottom-up manner, i.e. starts above the "leaf" level 
Rem (index >= length(heap) div 2) and goes then up towards 
Rem the root. 
Rem TODO: Check (and specify if needed) the argument and result types! 
Sub buildMaxHeap(heap)
  Rem TODO: Check and accomplish your variable declarations here: 
  Dim lgth As Integer
  Dim k As Integer
  Rem  
  lgth = length(heap)
  For k = lgth / 2 - 1 To 0 Step -1
    Call maxHeapify(heap, k, lgth)
  Next k
End Sub
Rem  
Rem Recursively sorts a subrange of the given array 'values´.  
Rem start is the first index of the subsequence to be sorted, 
Rem stop is the index BEHIND the subsequence to be sorted. 
Rem TODO: Check (and specify if needed) the argument and result types! 
Sub quickSort(values, start, stop)
  Rem TODO: Check and accomplish your variable declarations here: 
  Dim p As ???
  Rem  
  Rem At least 2 elements? (Less don't make sense.) 
  If stop >= start + 2 Then
    Rem Select a pivot element, be p its index. 
    Rem (here: randomly chosen element out of start ... stop-1) 
    p = random(stop-start) + start
    Rem Partition the array into smaller and greater elements 
    Rem Get the resulting (and final) position of the pivot element 
    p = partition(values, start, stop, p)
    Rem Sort subsequances separately and independently ... 

    Rem ========================================================== 
    Rem ================= START PARALLEL SECTION ================= 
    Rem ========================================================== 
    Rem TODO: add the necessary code to run the threads concurrently 

      Rem ----------------- START THREAD 0 ----------------- 
        Rem Sort left (lower) array part 
        Call quickSort(values, start, p)
      Rem ------------------ END THREAD 0 ------------------ 


      Rem ----------------- START THREAD 1 ----------------- 
        Rem Sort right (higher) array part 
        Call quickSort(values, p+1, stop)
      Rem ------------------ END THREAD 1 ------------------ 

    Rem ========================================================== 
    Rem ================== END PARALLEL SECTION ================== 
    Rem ========================================================== 

  End If
End Sub
Rem  
Rem Sorts the array 'values´ of numbers according to he heap sort 
Rem algorithm 
Rem TODO: Check (and specify if needed) the argument and result types! 
Sub heapSort(values)
  Rem TODO: Check and accomplish your variable declarations here: 
  Dim maximum As ???
  Dim k As Integer
  Dim heapRange As Integer
  Rem  
  Call buildMaxHeap(values)
  heapRange = length(values)
  For k = heapRange - 1 To 1 Step -1
    heapRange = heapRange - 1
    Rem Swap the maximum value (root of the heap) to the heap end 
    maximum = values(0)
    values(0) = values(heapRange)
    values(heapRange) = maximum
    Call maxHeapify(values, 0, heapRange)
  Next k
End Sub
