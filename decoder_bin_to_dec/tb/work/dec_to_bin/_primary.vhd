library verilog;
use verilog.vl_types.all;
entity dec_to_bin is
    port(
        i_d             : in     vl_logic_vector(3 downto 0);
        o_b1            : out    vl_logic;
        o_b2            : out    vl_logic;
        o_b3            : out    vl_logic;
        o_b4            : out    vl_logic;
        o_b5            : out    vl_logic;
        o_b6            : out    vl_logic;
        o_b7            : out    vl_logic
    );
end dec_to_bin;
