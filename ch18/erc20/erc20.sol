pragma solidity ^0.6.1;

contract MyERC20Token {
    mapping (address => uint256)  _balances;
    mapping (address => mapping(address => uint256)) _allowed;

    string public name = "My ERC20 Token";
    string public symbol = "MET";
    uint8  public decimals = 0;
    uint256 private _totalSupply =  100;

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    constructor() public {
       _balances[msg.sender] = _totalSupply;
        emit Transfer(address(0), msg.sender, _totalSupply);
    }

    function totalSupply() public view returns (uint) {
        return _totalSupply - _balances[address(0)];
    }

    function balanceOf(address _owner) public view returns (uint balance) {
        return _balances[_owner];
    }

    function allowance(address _owner, address _spender) public view returns (uint remaining) {
        return _allowed[_owner][_spender];
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(_balances[msg.sender] >= _value,"value exceeds senders balance");
        _balances[msg.sender] -= _value;
        _balances[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

  function approve(address _spender, uint256 _value) public returns (bool success)
    {
        _allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function transferfrom(address _from, address _to, uint256 _value) public returns (bool success)
    {
        require(_value <= _balances[_from],"Not enough balance");
        require(_value <= _allowed[_from][msg.sender],"Not enough allowance");
        _balances[_from] -= _value;
        _balances[_to] += _value;
        _allowed[_from][msg.sender] -= _value;
        emit Transfer(_from, _to, _value);
        return true;
    }
}