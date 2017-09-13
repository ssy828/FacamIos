func revers(num:Int) -> String
{
    var returnValue: String = ""
    var number = num
    
    while ((number/10) >= 0) && (number != 0)
    {
        returnValue = returnValue + "\(number%10)"
        number = (number/10)
    }
    
    return returnValue
}

print(revers(num:123))//321
print(revers(num:341))//143