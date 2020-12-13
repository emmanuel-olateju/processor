library ieee;
use ieee.std_logic_1164.all;

entity madder is
		port(
			u,v:in std_logic_vector(5 downto 0);
			w:buffer std_logic_vector(5 downto 0)
		);
end madder;

architecture m_adder of madder is
signal c:std_logic_vector(5 downto 0);
signal cin:std_logic_vector(5 downto 0);
signal result:std_logic_vector(5 downto 0);
begin

	--mapping  adder architecture
	cin(0)<='0';
	cin(1)<=c(0);
	cin(2)<=c(1);
	cin(3)<=c(2);
	cin(4)<=c(3);
	cin(5)<=c(4);
	
	--adder calculation process
	c(0)<=u(0) and v(0);
	w(0)<=u(0) xor v(0);
	w(5 downto 1)<=(not(u(5 downto 1)) and (v(5 downto 1) xor cin(5 downto 1))) or (u(5 downto 1) and not(v(5 downto 1) xor cin(5 downto 1)));
	c(5 downto 1)<=(u(5 downto 1) and cin(5 downto 1)) or (v(5 downto 1) and (u(5 downto 1) xor cin(5 downto 1)));
	
	--answer
	--result(6)<=c(5);
	--result(2 downto 0)<=w(2 downto 0);
	--w<=result;
end m_adder;