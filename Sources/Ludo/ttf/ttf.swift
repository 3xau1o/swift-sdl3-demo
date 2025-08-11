import SDL3
import SDL3.TTF

public class STTF {
    /// https://wiki.libsdl.org/SDL3_ttf/TTF_Init 
    public init?() {
        guard TTF_Init() else {
            return nil
        }
    }

    /// https://wiki.libsdl.org/SDL3_ttf/TTF_Quit 
    deinit {
        TTF_Quit()
    }
}
