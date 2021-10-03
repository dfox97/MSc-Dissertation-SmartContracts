pragma solidity 0.7.0;

contract assetTransfer{
    
    enum StateType {Active, 
    OfferPlaced, PendingInspection, 
    Inspected, Apprasied, inspectorApproved, 
    BuyerAccepted, SellerAccepted, Accepted,
    Terminated}
    
    StateType public State;
    
    address public InitOwner;
    string public Description; //bytes32
    uint public InitPrice;
    
    address public Buyer;
    uint public OfferPrice;
    
    address public Inspector;
    address public Apprasor;
    
    
    
    constructor(uint256 price, string memory detail){
        InitOwner=msg.sender;
        InitPrice=price;
        Description=detail;
        State=StateType.Active;
    }
    
    
    function TerminateContract()public{
        if(InitOwner != msg.sender){
            revert();
        }
        
        State=StateType.Terminated;
    }
    
    
    function UpdateAsset(uint256 price, string memory detail) public{
        if (State != StateType.Active || InitOwner != msg.sender){
            revert();
        }
        Description=detail;
        InitPrice = price;
    }
    
    function MakeOffer(uint256 priceOffer, address inspectorAddress, address apprasorAddress)public{
        if(apprasorAddress==address(0)||inspectorAddress==address(0)){//||InitOwner==msg.sender
            revert();
        }
        if ( State!= StateType.Active){
            revert();
        }
        Buyer=msg.sender;
        Inspector=inspectorAddress;
        Apprasor=apprasorAddress;
        OfferPrice=priceOffer;
        State=StateType.OfferPlaced;
        
    }
    
    //Accepted offer await inspection
    function offerAccepted()public{
        if (InitOwner != msg.sender){
            revert();
        }
        
        if (State == StateType.OfferPlaced){
            State = StateType.PendingInspection;
        }
        
    }
    
    //RejectOffer if offer isnt placed, inspection and approval has been agreed upon
    function RejectOffer()public{
        if(InitOwner != msg.sender){
            revert();
        }
        //if any of these states arnt set then revert function
        if(State!=StateType.inspectorApproved && State != StateType.Apprasied 
        && State != StateType.Inspected && State != StateType.PendingInspection
        && State != StateType.BuyerAccepted && State != StateType.OfferPlaced){
            revert();
        }
        
        Buyer=address(0);
        State = StateType.Active;
        
    }
    
    //aceept inspection , approval and owner
    function MakeTransfer()public{
        if( InitOwner != msg.sender && Buyer != msg.sender ){
            revert();
        }
        if(InitOwner == msg.sender 
        && State != StateType.inspectorApproved && State != StateType.BuyerAccepted){
            revert();
        }
        if (Buyer == msg.sender  
        && State != StateType.inspectorApproved && State != StateType.SellerAccepted ){
            revert();
        }
        
        
        
        if(Buyer == msg.sender){
            if(State == StateType.inspectorApproved){
                State = StateType.BuyerAccepted;
            }
            else if (State == StateType.SellerAccepted)
            {
                State = StateType.Accepted;
            }
        }
        else{
            if(State == StateType.inspectorApproved){
                State = StateType.SellerAccepted;
            }
            else if (State == StateType.BuyerAccepted){
                State = StateType.Accepted;
            }
        }
        
    }
    function ChangeOffer(uint256 priceOffer)public{
        if (State != StateType.OfferPlaced)
        {
            revert();
        }
        if (Buyer != msg.sender)
        {
            revert();
        }

        OfferPrice = priceOffer;
    }
    
    //revoke offer only if the owner is the person calling the function, reset buyer details.
    function revokeOffer()public{
        if (InitOwner != msg.sender){
            revert();
        }
        if(State!=StateType.OfferPlaced && State!=StateType.Inspected 
        && State!=StateType.Apprasied && State != StateType.PendingInspection 
        && State != StateType.inspectorApproved && State != StateType.SellerAccepted){
            revert();
        }
        Buyer=address(0);
        OfferPrice=0;
        State=StateType.Active;
    }
    //setAprraised
    function setApproval()public{
        //person must be an approver
        if(Apprasor != msg.sender){
            revert();
        }
        if(State == StateType.PendingInspection){
            State = StateType.Apprasied;
        }
        else if(State == StateType.Inspected){
            State = StateType.inspectorApproved;
        }
        else {
            revert();
        }
        
    }
    
    
    //setInspection
    function setInspection()public{
        
        if (Inspector != msg.sender){
            revert();
        }
        if (State == StateType.inspectorApproved){
            State = StateType.Inspected;
        }
        else if (State == StateType.Apprasied){
            State = StateType.inspectorApproved;
        }
        else{
            revert();
        }
    }
    
}