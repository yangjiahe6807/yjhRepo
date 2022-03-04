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

////////从此行开始加入自定义函数代码

Number.ToLetters = Document(
        "Number.ToLetters",
        "Converts a number  (starting at 1) to an alphabet representation. Works like column headers in Excel.",
        {[ 
            Description = "Column 27", 
            Code = "PBI[Number.ToLetters](27)", 
            Result = "AB"
        ]},
        (m as text)=>
            let 
                a="45434543545"
            in 
                a
),

Number.r23 = Document(
        "Number.ToLetters",
        "Converts a number  (starting at 1) to an alphabet representation. Works like column headers in Excel.",
        {[ 
            Description = "Column 27", 
            Code = "PBI[Number.ToLetters](27)", 
            Result = "AB"
        ]},
        (m as text)=>
            let 
                a="sss"
            in 
                a
)

///////自定义函数代码停止
],
Result = _extensionLibrary
in
  Result