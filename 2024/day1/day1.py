## DAY 1

list1 = []
list2 = []


def readFile():
    with open('puzzleInput.txt', 'r') as file:
        for line in file:
            num1, num2 = map(int, line.split())
            list1.append(num1)
            list2.append(num2)




def compare(list1, list2):
    longest = max(len(list1), len(list2))
    result = []
    i = 0
    while( i < longest):
        if(list1[i] >=  list2[i]):
            result.append(list1[i] - list2[i])
        else:
            result.append(list2[i] - list1[i])
        i = i + 1
    
    return result



def run():
    readFile()
    list1.sort()
    list2.sort()
    result = compare(list1,list2)
    return sum(result)
