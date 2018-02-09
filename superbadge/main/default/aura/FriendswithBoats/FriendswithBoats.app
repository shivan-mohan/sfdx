<aura:application extends="force:slds" access="global">
    <lightning:layout horizontalAlign="start">
        <lightning:layoutItem size="12" class="slds-m-left_small slds-m-right_small slds-m-top_medium slds-m-bottom_medium">
            <lightning:card title="Friends with Boats" />
        </lightning:layoutItem>
    </lightning:layout>
	<lightning:layout horizontalAlign="start">
        <lightning:layoutItem size="8" flexibility="auto" class="slds-m-left_medium slds-m-bottom_medium">
            <c:BoatSearch />
        </lightning:layoutItem>
        <lightning:layoutItem size="4" flexibility="auto" class="">
        </lightning:layoutItem>
    </lightning:layout>
</aura:application>