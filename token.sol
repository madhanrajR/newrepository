import "./Erc20.sol";
contract test is Token
{
    uint256 public totalsupply=1000;
        string public name;
   string public symbol;
    uint256 public decimal;
    address a;
    mapping(address => uint256)m;
    function test()
    {
        a=msg.sender;
        name="madhan";
        symbol="eew";
        decimal=0;
    }
    modifier mm()
    {
        require(a==msg.sender);
        _;
    }
    function transfer(address to,uint256 amount)mm()
    {
        require(amount<=m[msg.sender]);
        m[msg.sender]-=amount;
        m[to]+=amount;
    }
    function mint(uint256 _amount)mm()
    {
        require((m[msg.sender]+_amount)<=totalsupply&&_amount<=totalsupply);
        m[msg.sender]+=_amount;
    }
    
    function balanceOf(address _owner)public constant returns (uint256 balance)
    {
        return m[_owner];
    }
}
