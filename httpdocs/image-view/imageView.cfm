<cfsilent>
<cfxml variable="imageXml">
    <!--- Let IMG be the only tag in this XML document. --->
    <cfimage action="writeToBrowser" source="#getTempDirectory()##URL.filename#" />
</cfxml>
<!---
    At this point, our XML object should have one tag - IMG - from
    which we can extract the SRC attribute as the temporary image
    path on the CFImage file servlet.
--->
</cfsilent><cfoutput>#imageXml.xmlRoot.xmlAttributes.src#</cfoutput>