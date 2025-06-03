open System.IO
open System.Text

let utf8 = new UTF8Encoding(false, true)

let lines = File.ReadAllLines("politics-patterns.txt", utf8)

let buildFilterFile (filename: string) (title: string) (lineGenerator: string -> string) =
    use outputStream = File.Create filename
    use writer = new StreamWriter(outputStream, utf8)

    writer.WriteLine $"""# Title: {title}
# Homepage: https://github.com/aldaviva/content-blocking-filters/
# Expires: 1 days"""
    
    for line in lines do
        writer.WriteLine()
        writer.Write(lineGenerator line)

    printfn $"Wrote {filename}"

buildFilterFile "filters/twitter-politics.txt" "Ben's Twitter Politics Filter" (fun keyword -> 
    $"x.com##div[aria-label='Timeline: Your Home Timeline'] > div > div > div > div:has(article[data-testid='tweet'] > div > div > div > div > div:nth-child(2):has-text({keyword})):style(opacity: 0; height: 0)")

buildFilterFile "filters/bluesky-politics.txt" "Ben's Bluesky Politics Filter" (fun keyword -> 
    $"bsky.app##div[data-testid^='feedItem-by-']:has(:is(div[data-testid=postText], div[aria-label^='Post by '] > div[dir=auto]):has-text({keyword}))")
