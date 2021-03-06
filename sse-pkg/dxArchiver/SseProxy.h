/*******************************************************************************

 File:    SseProxy.h
 Project: OpenSonATA
 Authors: The OpenSonATA code is the result of many programmers
          over many years

 Copyright 2011 The SETI Institute

 OpenSonATA is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.
 
 OpenSonATA is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License
 along with OpenSonATA.  If not, see<http://www.gnu.org/licenses/>.
 
 Implementers of this code are requested to include the caption
 "Licensed through SETI" with a link to setiQuest.org.
 
 For alternate licensing arrangements, please contact
 The SETI Institute at www.seti.org or setiquest.org. 

*******************************************************************************/


#ifndef _sseproxy_h
#define _sseproxy_h

#include "sseDxInterface.h"
#include "sseDxArchiverInterface.h"
#include "NssProxy.h"

class DxArchiver;

class SseProxy : public NssProxy
{

public:
    SseProxy(ACE_SOCK_STREAM &stream);
    virtual ~SseProxy();

    void setDxArchiver(DxArchiver *dxArchiver);
    string getName();

    // outgoing messages to sse
    void sendNssMessage(const NssMessage &nssMessage, int activityId = -1);
    void sendIntrinsics(const DxArchiverIntrinsics &intrinsics);
    void sendArchiverStatus(const DxArchiverStatus &status);

private:
    // Disable copy construction & assignment.
    // Don't define these.
    SseProxy(const SseProxy& rhs);
    SseProxy& operator=(const SseProxy& rhs);
    
    void sendMessage(int messageCode, int activityId = -1, int dataLength = 0,
			       const void *msgBody = 0);

    void handleIncomingMessage(SseInterfaceHeader *hdr, void *bodybuff);


    DxArchiver *dxArchiver_;

};



#endif // _sseproxy_h