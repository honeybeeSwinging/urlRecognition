# urlRecognition
网址URL识别和判断是否是网址URL


整个项目这个方法是关键，在其他地方也可以直接把这个方法加入进去，然后进行网址识别。

/**
 * 网址正则验证
 *
 *  @param string 要验证的字符串
 *
 *  @return 返回值类型为BOOL
 */
- (BOOL)urlValidation:(NSString *)string {
    
    NSError *error;
    // 正则表达式
    NSString *regulaStr =@"^(?=^.{3,255}$)(http(s)?:\/\/)?(www\.)?[a-zA-Z0-9][-a-zA-Z0-9]{0,62}(\.[a-zA-Z0-9][-a-zA-Z0-9]{0,62})+(:\d+)*(\/\w+\.\w+)*([\?&]\w+=\w*)*$";
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regulaStr
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    NSArray *arrayOfAllMatches = [regex matchesInString:string options:0 range:NSMakeRange(0, [string length])];
    
    for (NSTextCheckingResult *match in arrayOfAllMatches){
        
        NSString *substringForMatch = [string substringWithRange:match.range];
        
        self.urlStr = substringForMatch;//把网址传出去
        
        return YES;
    }
    return NO;
}
