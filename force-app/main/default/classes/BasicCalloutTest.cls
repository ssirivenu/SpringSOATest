@isTest
private class BasicCalloutTest{
    @isTest static void AnimalLocatorMock1() {
        Test.setMock(HttpCalloutMock.class, new MockMakeGetCallout());
        string result = BasicCallOut.makeGetCallout('bar1','bar2').ToString();
        String expectedResult = '{"args": { "foo1": "bar1", "foo2": "bar2" } "headers": { "x-forwarded-proto": "https",  "x-forwarded-port": "443","host": "postman-echo.com", "x-amzn-trace-id": "Root=1-604a95af-2c4a163e6812ba62154becd7", "user-agent": "PostmanRuntime/7.26.10","accept": "*/*","postman-token": "57b7686d-2d9e-4fb8-a6a4-0af8e761ffec", "accept-encoding": "gzip, deflate, br"},"url": "https://postman-echo.com/get?foo1=bar1&foo2=bar2"}';
        System.assertEquals(result,expectedResult );
    }
}