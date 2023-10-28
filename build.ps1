$utf8NoBom = New-Object Text.UTF8Encoding $false

function buildFilterList {
    param([string] $outputFilename, [string] $title, [string] $patternPrefix, [string] $patternSuffix)

    $linesToWrite = (getHeader $title) + ((gc .\patterns.txt -Encoding UTF8) | %{ "$patternPrefix$_$patternSuffix" })
    writeAllLines $outputFilename $linesToWrite
}

function getHeader {
    param([string] $title)
    @(
        "# Title: $title",
        "# Homepage: https://github.com/aldaviva/content-blocking-filters/",
        "# Expires: 1 days",
        ""
    )
}

function resolvePath {
    param([string] $relativePath)
    $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($relativePath)
}

function writeAllLines {
    param([string] $filename, [string[]] $lines, [string] $lineEnding="`n", [Text.Encoding] $encoding=$utf8NoBom)
    [IO.File]::WriteAllText((resolvePath $filename), [string]::Join($lineEnding, $lines), $encoding)
}

buildFilterList -outputFilename ".\filters\twitter-politics.txt" -title "Ben's Twitter Politics Filter" -patternPrefix "twitter.com##div[aria-label='Timeline: Your Home Timeline'] > div > div > div > div:has(article[data-testid='tweet'] > div > div > div > div > div:nth-child(2):has-text(" -patternSuffix ")):style(opacity: 0; height: 0)"

buildFilterList -outputFilename ".\filters\bluesky-politics.txt" -title "Ben's Bluesky Politics Filter" -patternPrefix "bsky.app##div[data-testid^='feedItem-by-']:has(:is(div[data-testid=postText], div[aria-label^='Post by '] > div[dir=auto]):has-text(" -patternSuffix "))"