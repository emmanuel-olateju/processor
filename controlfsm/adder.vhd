library ieee;
use ieee.std_logic_1164.all;

entity adder is
	port(
		a,b:in std_logic_vector(2 downto 0);
		s:buffer std_logic_vector(3 downto 0)
	);
end adder;

architecture alu_adder of adder is
signal c:std_logic_vector(2 downto 0);
signal cin:std_logic_vector(2 downto 0);
signal result:std_logic_vector(3 downto 0);
begin

	--mapping  adder architecture
	cin(0)<='0';
	cin(1)<=c(0);
	cin(2)<=c(1);
	
	--adder calculation process
	c(0)<=a(0) and b(0);
	s(0)<=a(0) xor b(0);
	s(2 downto 1)<=(not(a(2 downto 1)) and (b(2 downto 1) xor cin(2 downto 1))) or (a(2 downto 1) and not(b(2 downto 1) xor cin(2 downto 1)));
	c(2 downto 1)<=(b(2 downto 1) and cin(2 downto 1)) or (a(2 downto 1) and (b(2 downto 1) xor cin(2 downto 1)));
	
	--answer
	result(3)<=c(2);
	result(2 downto 0)<=s(2 downto 0);
	s<=result;
end alu_adder;