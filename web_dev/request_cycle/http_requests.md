200 OK
request succeeded, information returned with response dependent on method used in the request.

300 Multiple Choices
requested resource has different choices and cannot resolve into one; example if there are several index.html pages for which language is wanted.

301 Moved Permanently
request code has been assigned new perminant URL and future reference should use one of the returned URLs

302 Found
requested resource resides temporarily under a different URL. Since the redirection might be altered on occasion, the client should continue to use the request-URL for future requests.

400 Bad Request
request could not be understood by server due to malformed syntax. Client should not repeat the request without modifications.

403 Forbidden
server understood request but is refusing to fulfill it. Authorization will not help and request should not be repeated.

404 Not Found
Server has not found anything matching the request-URL. No indication is given on whether the condition is temporary or not.

501 Not Implemented
server does not support functionality required to fulfill request. For when the server does not recognize request method and is not capable of suppporing it anymore.

503 Service Unavailable
Webserver unable to handle HTTP request at this time for a number of reasons. This is usually temporary since you get a return code, part of the server is working.

550 Permission Denied
The server is staing the account you have logged in does not have permission to perform the action you are attempting. 


Get vs Post
Get: requests data from a specified resource, When reloading page or clicking back, the method is harmless, it can be bookmarked, encoding type is application/x-www-form-urlencoded, parameters remain in browser history, restricts data length when sending data (max 2048 characters), Only ASCII characters allowed, is less secure than post since data sent is part of the url (don't use for passwords), data visible to everyone on url.
Post: Submits data to be processed to a specified resource, data resubmitted when refreshing/backspace, cannot be bookmarked, not cached, encoding type application/x-www-form-urlecnoded or multipart/form-data, parameters not saved in browser history, no restrictions on data length, no restictions on data type, Post is safer than get for security, Data is not displayed in the url.

Cookies: small piece of data sent from a website stored in user's web browser while user is browsing. Used for browser to remember stateful information. Also they can remember arbitrary information like names, addresses, passwords...


