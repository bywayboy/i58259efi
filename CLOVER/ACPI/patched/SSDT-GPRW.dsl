//
// In config ACPI, GPRW to XPRW
// Find:     47505257 02
// Replace:  58505257 02
//
DefinitionBlock ("", "SSDT", 2, "OCLT", "GPRW", 0)
{
    /*
    External (_SB_.PCI0.XDCI, DeviceObj)
    External (_SB_.PCI0.CNVW, DeviceObj)
    External(GPRW, MethodObj)
    

    Method (\_SB.PCI0.XDCI._PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
    {
        Return (\GPRW (0x6D, 0x00))
    }
    Method (\_SB.PCI0.CNVW._PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
    {
        Return (\GPRW (0x6D, 0x00))
    }
    */
    
    External(XPRW, MethodObj)
    Method (GPRW, 2, NotSerialized)
    {
        If (_OSI ("Darwin"))
        {
            If ((0x6D == Arg0))
            {
                Return (Package ()
                {
                    0x6D, 
                    Zero
                })
            }

            If ((0x0D == Arg0))
            {
                Return (Package ()
                {
                    0x0D, 
                    Zero
                })
            }
        }
        Return (XPRW (Arg0, Arg1))
    }
}

