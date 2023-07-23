import XCTest
@testable import QuickzoomLib

final class EventParserTests: XCTestCase {
    func testZoomLinkWithPassword() throws {
        XCTAssertEqual(parseDescription(description: "-::~:~::~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~::~:~::-\nJoin Zoom Meeting\nhttps://company.zoom.us/j/34829385022?pwd=MEiDY0wv8aLVwCtoClRGyiv1Q2Ihan34 (ID: 34829385022, passcode: 555333)\n\nJoin by phone\n8778535257 (passcode: 555333)\n08002825751 (passcode: 555333)\n\nJoining instructions: https://www.google.com\n\nMeeting host: <a href=\"mailto:fake@fake.net\" target=\"_blank\">fake@fake.net</a><br /><br />Join Zoom Meeting: <br /><a href=\"https://www.google.com/url?q=https://company.zoom.us/j/34829385022?pwd%3DMEiDY0wv8aLVwCtoClRGyiv1Q2Ihan34&amp;sa=D&amp;source=calendar&amp;usg=AOvVaw1u6stvfFz8Ap8qkfY9Us8W\" target=\"_blank\">https://company.zoom.us/j/34829385022?pwd=MEiDY0wv8aLVwCtoClRGyiv1Q2Ihan34</a>\n\nPlease do not edit this section.\n-::~:~::~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~::~:~::-"), "https://company.zoom.us/j/34829385022?pwd=MEiDY0wv8aLVwCtoClRGyiv1Q2Ihan34")
    }
    
    func testZoomLinkWithNoPassword() throws {
        XCTAssertEqual(parseDescription(description: "-::~:~::~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~::~:~::-\nJoin Zoom Meeting\nhttps://company.zoom.us/j/34829385022 (ID: 34829385022, passcode: 555333)\n\nJoin by phone\n8778535257 (passcode: 555333)\n08002825751 (passcode: 555333)\n\nJoining instructions: https://www.google.com\n\nMeeting host: <a href=\"mailto:fake@fake.net\" target=\"_blank\">fake@fake.net</a><br /><br />Join Zoom Meeting: <br /><a href=\"https://www.google.com/url?q=https://company.zoom.us/j/34829385022?pwd%3DMEiDY0wv8aLVwCtoClRGyiv1Q2Ihan34&amp;sa=D&amp;source=calendar&amp;usg=AOvVaw1u6stvfFz8Ap8qkfY9Us8W\" target=\"_blank\">https://company.zoom.us/j/34829385022?pwd=MEiDY0wv8aLVwCtoClRGyiv1Q2Ihan34</a>\n\nPlease do not edit this section.\n-::~:~::~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~::~:~::-"), "https://company.zoom.us/j/34829385022")
    }
}
