library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity design is
Port (
    f_d1 : in std_logic_vector(3 downto 0);
        f_d2 : in std_logic_vector(3 downto 0);
        f_d3 : in std_logic_vector(3 downto 0);
        f_d4 : in std_logic_vector(3 downto 0);
        f_cathode : out std_logic_vector(7 downto 0);
        f_anode : out std_logic_vector(3 downto 0);
        clk_in_1: in std_logic
 );
end design;

architecture Behavioral of design is
component Timing_block
Port (
clk_in : in STD_LOGIC; -- 100 MHz input clock
--reset : in STD_LOGIC; -- Reset signal
mux_select : out STD_LOGIC_VECTOR (1 downto 0); -- Signal for the mux
anodes : out STD_LOGIC_VECTOR (3 downto 0) -- Anodes signal for display
);
end component;
component multiplexer
Port ( d1 : in std_logic_vector(3 downto 0);
        d2 : in std_logic_vector(3 downto 0);
        d3 : in std_logic_vector(3 downto 0);
        d4 : in std_logic_vector(3 downto 0);
        o : out std_logic_vector(3 downto 0);
        s: in std_logic_vector(1 downto 0)
             );
             end component;
component seven_seg_decoder
Port (
variables : in STD_LOGIC_VECTOR (3 downto 0); -- Reset signal
cathodes : out STD_LOGIC_VECTOR (7 downto 0)-- Anodes signal for display
);
end component;

signal mux_out : std_logic_vector(3 downto 0);
signal time_out : std_logic_vector(1 downto 0);
begin
T1: Timing_block port map(
clk_in=>clk_in_1,
mux_select=>time_out,
anodes=>f_anode
--reset=>'0'
);
M1: multiplexer port map(
    d1=>f_d1,
    d2=>f_d2,
    d3=>f_d3,
    d4=>f_d4,
    o=>mux_out,
    s=>time_out
);
Sev1: seven_seg_decoder port map(
    variables=>mux_out,
    cathodes=>f_cathode
);

end Behavioral;