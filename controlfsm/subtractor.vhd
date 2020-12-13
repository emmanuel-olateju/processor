library ieee;
use ieee.std_logic_1164.all;

entity subtractor is
	port(
		a,b:in std_logic_vector(2 downto 0);
		s:buffer std_logic_vector(3 downto 0)
	);
end subtractor;
architecture alu_subtractor of subtractor is
signal compb:std_logic_vector(2 downto 0);
signal c:std_logic_vector(2 downto 0);
signal cin:std_logic_vector(2 downto 0);
--signal result:std_logic_vector(3 downto 0);
begin
	--mapping subtractor architecture
	cin(0)<='1';
	cin(1)<=c(0);
	cin(2)<=c(1);
	c(2)<='1';
	s(3)<='0';
	
	--subtractor calculation process
	compb<=b xor "111";
	c(0)<=(compb(0) and cin(0)) or (a(0) and (compb(0) xor cin(0)));
	s(0)<=(not(a(0)) and (compb(0) xor cin(0))) or (a(0) and not(compb(0) xor cin(0)));
	s(2 downto 1)<=(not(a(2 downto 1)) and (compb(2 downto 1) xor cin(2 downto 1))) or (a(2 downto 1) and not(compb(2 downto 1) xor cin(2 downto 1)));
	c(1)<=(compb(1) and cin(1)) or (a(1) and (compb(1) xor cin(1)));
	
end alu_subtractor;