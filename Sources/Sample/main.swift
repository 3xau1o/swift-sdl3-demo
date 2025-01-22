import Foundation
import libcurl
import libsdl

// class Response {
//     var data = Data()

//     var body: String { String(data: data, encoding: .ascii)! }
// }

let title = "zig_sdl"
let w: Int32 = 640
let h: Int32 = 480

SDL_Init(SDL_INIT_VIDEO)
let window = SDL_CreateWindow(title, w, h, 0)

var quit = false
var event = SDL_Event()

while !quit {
    while SDL_PollEvent(&event) {
        switch event.type {
        case SDL_EVENT_QUIT.rawValue:
            quit = true
            // print quit
            print("test")
        default:
            break
        }
    }
    SDL_Delay(16)
}

// var response = Response()

// let handle = curl_easy_init()
// curl_easy_setopt_string(handle, CURLOPT_URL, "http://www.google.com")

// // let pointerResult = curl_easy_setopt_pointer(handle, CURLOPT_WRITEDATA, &response)
// // guard pointerResult == CURLE_OK else {
// //     fatalError("Could not set response pointer")
// // }
// // curl_easy_setopt_func(handle, CURLOPT_WRITEFUNCTION) { buffer, size, n, reference in
// //     let length = size * n
// //     let data = buffer!.assumingMemoryBound(to: UInt8.self)
// //     let p = reference?.assumingMemoryBound(to: Response.self).pointee
// //     p?.data.append(data, count: length)
// //     return length
// // }

// let ret = curl_easy_perform(handle)
// guard ret == CURLE_OK else {
// //    let error = curl_easy_strerror(ret)
// //    print("error: ", error)
//     fatalError("Something went wrong with the request")
// }
// curl_easy_cleanup(handle)

// print(response.body)
