
let
_extensionLibrary = [

Document = (name as text, description as text, valueOrExample as any, optional valueIfExample as any) =>
    let
        value = if valueIfExample is null then valueOrExample else valueIfExample,
        examples = if valueIfExample is null then {} else valueOrExample
    in
        Value.ReplaceType(value, Value.Type(value) meta [
            Documentation.Name = name, 
            Documentation.Description = description,  
            // [Description = "", Code="", Result =""]
            Documentation.Examples = examples
        ]),


///////////////////////// 
// 示例              //
/////////////////////////

//------------------------------------------------------------------------------
Example.Test =
   Document(
        "Example.Test",
        "这里是函数描述：返回传入的参数",
        {[ Description = "你好", Code ="fns[Example.Test](""你好"")", Result = "你好"]},
        (a as text) as text => 
            let
                Result=a
            in
                Result
    ),
//-------------------------------------------------------------------------------
//-------------------------------------------------------------------------------
Example.Test2 =
   Document(
        "Example.Test2",
        "在传入的文本前添加：你好",
        {[ Description = "你好,杨家和", Code ="fns[Example.Test2](""杨家和"")", Result = "你好，杨家和"]},
        (a as text) as text => 
            let
                Result="你好，" & a
            in
                Result
    ),
//--------------------------------------------------------------------------------

//--------------------------------------------------------------------------------
Example.Test3 =
   Document(
        "Example.Test3",
        "将两个传入的参数相加",
        {[ Description = "2+3=5", Code ="fns[Example.Test3](2,3)", Result = "5"]},
        (x as number,y as number) as number => 
            let
                a="a",
                Result= x + y
            in
                Result
    ),
//--------------------------------------------------------------------------------

///////////////////////// 
// Value               //
/////////////////////////

Value.TypeText = (value as any) => 
    if value is binary then "binary" else
    if value is date then "date" else
    if value is datetime then "datetime" else
    if value is datetimezone then "datetimezone" else
    if value is duration then "duration" else
    if value is function then "function" else
    if value is list then "list" else
    if value is logical then "logical" else
    if value is none then "none" else
    if value is null then "null" else
    if value is number then "number" else
    if value is record then "record" else
    if value is table then "table" else
    if value is text then "text" else
    if value is time then "time" else
    if value is type then "type" else
    if value is any then "any"
    else error "unknown -- not a primitive type!"

]
in
    _extensionLibrary