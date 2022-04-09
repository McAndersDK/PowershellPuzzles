BeforeAll {
    . .\Answer.ps1
}
Describe 'Test the Answer' {
    It "Test with a size of '<Size>'"  -TestCases @(
        @{ Size = '1'; Row = ('H|L|O+'); Column = ('[^SPEAK]+') }
        @{ Size = '2'; Row = ('HE|LO|O+','[PLEASE]+'); Column = ('[^SPEAK]+','EP|IP|EF')}
        @{ Size = '3'; Row = ('PWS|LOO|O+','H[PO]+','[WNS]+'); Column = ('[^SEAKON]+','WPN|IPD|EFD','[SO]+')}
    ) {
        param ($Size, $Row, $Column)
        $Response = (SolveRegexPuzzle -Size $Size -Row $Row -Column $Column) |out-string 
        $Expected = (Get-Content ".\tests\Response$size.txt" ) |out-string
        $Response | Should -Be $Expected
    }
}