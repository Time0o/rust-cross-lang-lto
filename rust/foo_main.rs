#[link(name="foo_c")]
extern "C" {
    pub fn foo_do_something();
}

fn main() {
    unsafe { foo_do_something(); }
}
